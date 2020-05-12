class ImageProcessingJob < ApplicationJob
	retry_on StandardError # defaults to 3s wait, 5 attempts, can be customized

	def perform (image_id) #need to explicity update attributes here vs the old model bc this is occuring AFTER save, unlike the former structure where @image was saved to db later in controller
		@image = Image.find_by(id: image_id)
		@image.update_attributes(processing_status: "processing") #update w/o save method (which would trigger loop)
		@image.processing_status = "processing"
		binding.pry
		process
		@image.processing_status = "completed"
		@image.save
		# @image.assign_attributes(processing_status: "completed", odometer_reading: odometer_reading,  last_change: last_oil_change_mileage, oil_mileage: current_oil_mileage)
		# NotificationMailer.with(image: @image).first_notification.deliver_now
		# NotificationMailer.with(image: @image).first_notification.deliver_later(wait: 5.seconds)
	end
	
	def process 
		@image.odometer_reading = odometer_reading 
		@image.last_change = last_oil_change_mileage 
		@image.oil_mileage = current_oil_mileage
	end

	def response_text
		@response_text ||= google_api_response.parsed_response["responses"][0]["fullTextAnnotation"]["text"]
	end

	def miles_index
		@miles_index ||= response_text.index("miles")
	end

	def odometer_reading
		@odometer_reading ||= 
		if miles_index.nil?
			1000000
		else
			response_text[miles_index-7..miles_index-2] 
		end
	end

	def url
		"https://vision.googleapis.com/v1/images:annotate?key=" + Rails.application.credentials.google_api_key
	end

	def body
		{ 
			requests: [
				{
					image: {
						source: {
							imageUri: @image.picture.service_url
						}
					},
					features: [
						{
							type: "TEXT_DETECTION"
						}
					]
				}
			]
		}
	end

	def google_api_response
		@google_api_response ||= HTTParty.post(url, headers: {"Content-Type" => "application/json; charset=UTF-8"}, body: body.to_json)
	end

	def last_oil_change_mileage
		#oil changes for user
		oil_changes = Image.where(oil_change: "true", user_id: @image.user_id)
		#if image is an oil change
		if @image.oil_change == true
			return @image.odometer_reading
		#if db lacks images or lacks oil changes
		elsif oil_changes.count == 0
			return 0
		end
	  #find last oil change mileage
	  last_oil_change_mileage = oil_changes.where(odometer_reading: oil_changes.maximum('odometer_reading')).to_a[0].odometer_reading
	end

	def current_oil_mileage
		@image.odometer_reading - @image.last_change
	end
end