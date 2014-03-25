# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :place do
    name "MyString"
    lat 1.5
    lon 1.5
    geoname_id 1
    country "Denmark"
    country_code "DK"
  end
end
