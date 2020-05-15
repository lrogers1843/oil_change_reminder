# response_text for ocr

subaru = "Ев\n4\nOMPH\n80\n60\n100\n120 140\nx1000rlmin\n40\n100\n160\n180, 120\n80\n60\nP]\n200-\n-40\n20\n1\nA 1079.8\n036622 miles\n220\n-20\nTRI\n240 140\nkm/h\n80\nMPH\nMPG\nこf三\n"

jackie = "HT\n120665\n3\n60\n80\n6.\n40\n100\n120\n80\n160\n2040\n-120\n- 1\n200\n140\n8\nkm/h\nMPH\nRPMX1000\nPASH\nTRIP\n5.\n"

mom = "PARK B\nA 5884.0\n16924mi\n"

moto = "5 6\n4\n55\n65\n45\n75\n100\n85\n80\n120\nEE E95\n40\n160\n105\n20\n180\n132090\n115\n1\nx1000rpm\nmph\nTEMP\nkm/h :\nTURN\nTURN\nTAIL\nLISHT\nQIL\nBEA\n7RAL\n1G\nHONDA\nFRONT\nPRESS\n0~0.4k\nFUSE\naPLOGE\n"

images = "100 120\nkm/h 140\n160\n80\n60\n40\n180\n20\n200\n220\n008246.\n"

ebmw = "60\n100\n120 140\n100\n40-80\n160\n180- 120\n200\n1/min x 1000\n60\n6\n-40\n20\n220-\n-1\n140\n240\n260\n160\nこ20\n7\n140\n360\n212 mì\nTemp\n+64F\nmiles\n4919.3\n36916\nIgnition switched on\n"


# def get_num(x) 
#     x.scan(/\D(\d\d*)\D/)
# end

# def find_max_num (response_text)
# j_num_strings = response_text.scan(/\D(\d\d*)\D/)
# j_nums_ints = j_num_strings.map { |n| n[0].to_i }
# j_nums_ints.max
# end

# p nums = get_num(ebmw)
# p find_max_num(nums)
 

# labels

dad = {"responses"=>
    [{"labelAnnotations"=>
       [{"mid"=>"/m/02rs44", "description"=>"Speedometer", "score"=>0.9541146, "topicality"=>0.9541146},
        {"mid"=>"/m/05kc0j", "description"=>"Gauge", "score"=>0.94767123, "topicality"=>0.94767123},
        {"mid"=>"/m/07yv9", "description"=>"Vehicle", "score"=>0.9151053, "topicality"=>0.9151053},
        {"mid"=>"/m/056hv", "description"=>"Measuring instrument", "score"=>0.9008963, "topicality"=>0.9008963},
        {"mid"=>"/m/08dz3q", "description"=>"Auto part", "score"=>0.8935353, "topicality"=>0.8935353},
        {"mid"=>"/m/0jmbc", "description"=>"Odometer", "score"=>0.88008773, "topicality"=>0.88008773},
        {"mid"=>"/m/0k4j", "description"=>"Car", "score"=>0.87490827, "topicality"=>0.87490827},
        {"mid"=>"/m/01hyhj", "description"=>"Tachometer", "score"=>0.782447, "topicality"=>0.782447},
        {"mid"=>"/m/07k1x", "description"=>"Tool", "score"=>0.652987, "topicality"=>0.652987},
        {"mid"=>"/m/0bmd84", "description"=>"Fuel gauge", "score"=>0.520211, "topicality"=>0.520211}]}]}

jackie = {"responses"=>
    [{"labelAnnotations"=>
       [{"mid"=>"/m/01prls", "description"=>"Land vehicle", "score"=>0.9961627, "topicality"=>0.9961627},
        {"mid"=>"/m/07yv9", "description"=>"Vehicle", "score"=>0.99030316, "topicality"=>0.99030316},
        {"mid"=>"/m/0k4j", "description"=>"Car", "score"=>0.98701257, "topicality"=>0.98701257},
        {"mid"=>"/m/05kc0j", "description"=>"Gauge", "score"=>0.9539706, "topicality"=>0.9539706},
        {"mid"=>"/m/056hv", "description"=>"Measuring instrument", "score"=>0.9325706, "topicality"=>0.9325706},
        {"mid"=>"/m/02rs44", "description"=>"Speedometer", "score"=>0.92438453, "topicality"=>0.92438453},
        {"mid"=>"/m/01hyhj", "description"=>"Tachometer", "score"=>0.90732276, "topicality"=>0.90732276},
        {"mid"=>"/m/08dz3q", "description"=>"Auto part", "score"=>0.9024262, "topicality"=>0.9024262},
        {"mid"=>"/m/07k1x", "description"=>"Tool", "score"=>0.86502343, "topicality"=>0.86502343},
        {"mid"=>"/m/0jmbc", "description"=>"Odometer", "score"=>0.73891973, "topicality"=>0.73891973}]}]}

moto = {"responses"=>
    [{"labelAnnotations"=>
       [{"mid"=>"/m/012f08", "description"=>"Motor vehicle", "score"=>0.98018134, "topicality"=>0.98018134},
        {"mid"=>"/m/02rs44", "description"=>"Speedometer", "score"=>0.95081407, "topicality"=>0.95081407},
        {"mid"=>"/m/05kc0j", "description"=>"Gauge", "score"=>0.9174042, "topicality"=>0.9174042},
        {"mid"=>"/m/07yv9", "description"=>"Vehicle", "score"=>0.91380996, "topicality"=>0.91380996},
        {"mid"=>"/m/01hyhj", "description"=>"Tachometer", "score"=>0.8468565, "topicality"=>0.8468565},
        {"mid"=>"/m/04_sv", "description"=>"Motorcycle", "score"=>0.8284246, "topicality"=>0.8284246},
        {"mid"=>"/m/08dz3q", "description"=>"Auto part", "score"=>0.8186512, "topicality"=>0.8186512},
        {"mid"=>"/m/0jmbc", "description"=>"Odometer", "score"=>0.72520536, "topicality"=>0.72520536},
        {"mid"=>"/m/0k4j", "description"=>"Car", "score"=>0.67507726, "topicality"=>0.67507726},
        {"mid"=>"/m/056hv", "description"=>"Measuring instrument", "score"=>0.6712147, "topicality"=>0.6712147}]}]}

mom = {"responses"=>
    [{"labelAnnotations"=>
       [{"mid"=>"/m/012f08", "description"=>"Motor vehicle", "score"=>0.98018134, "topicality"=>0.98018134},
        {"mid"=>"/m/02rs44", "description"=>"Speedometer", "score"=>0.95081407, "topicality"=>0.95081407},
        {"mid"=>"/m/05kc0j", "description"=>"Gauge", "score"=>0.9174042, "topicality"=>0.9174042},
        {"mid"=>"/m/07yv9", "description"=>"Vehicle", "score"=>0.91380996, "topicality"=>0.91380996},
        {"mid"=>"/m/01hyhj", "description"=>"Tachometer", "score"=>0.8468565, "topicality"=>0.8468565},
        {"mid"=>"/m/04_sv", "description"=>"Motorcycle", "score"=>0.8284246, "topicality"=>0.8284246},
        {"mid"=>"/m/08dz3q", "description"=>"Auto part", "score"=>0.8186512, "topicality"=>0.8186512},
        {"mid"=>"/m/0jmbc", "description"=>"Odometer", "score"=>0.72520536, "topicality"=>0.72520536},
        {"mid"=>"/m/0k4j", "description"=>"Car", "score"=>0.67507726, "topicality"=>0.67507726},
        {"mid"=>"/m/056hv", "description"=>"Measuring instrument", "score"=>0.6712147, "topicality"=>0.6712147}]}]}

        #google_text_api_response.parsed_response["responses"][0]["labelAnnotations"][0]

        labels_array = mom["responses"][0]["labelAnnotations"]
        label_check = []
        labels_array.each do |label|
            label_check.push(label.has_value?("Vehicle"))
            label_check.push(label.has_value?("Gauge"))
        end
        p label_check
