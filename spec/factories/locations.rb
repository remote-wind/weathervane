FactoryGirl.define do
  factory :location, class: "Weathervane::Location" do
    name "MyString"
    lat 1.5
    lng 1.5
    geoname_id 1
    district "Gylland"
    country "Denmark"
    country_code "DK"
  end
end
