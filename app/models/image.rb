class Image < ApplicationRecord
	has_one_attached :picture
	belongs_to :user
	
	PROCESSING_STATUSES = %w(queued processing completed) #this constant really just here to use in the validation below. Could be used for dropdown form. just a very common thing to re-use

	validates :processing_status, inclusion: {in: PROCESSING_STATUSES} #requires that the record have non-nil value here
	attribute :processing_status, default: "queued" #applies to new but not existing records created from rails
	attribute :time_stamp, default: Time.now

	after_commit :process_image, on: :create #this waits until after the db has confirmed that it's completed the save action. runs on create not update

	def process_image
		ImageProcessingJob.perform_later(id)
	end
	
end
