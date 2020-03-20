FactoryBot.define do
  factory :notification do
    scheduled_time { "2020-03-19 20:25:24" }
    message { "MyString" }
  end

  factory :image do
    time_stamp { "2020-03-19 20:22:47" }
    odometer_reading { 1 }
    oil_change { false }
  end


end
