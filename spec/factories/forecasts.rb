# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :forecast do
    valid_from "2014-03-25 17:49:59"
    valid_until "2014-03-25 17:49:59"
    reference_time "2014-03-25 17:49:59"
    speed 1.5
    gust 1.5
    direction 1.5
    temperature 40
    pressure 1000
  end
end
