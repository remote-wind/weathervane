# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :provider, class: "Weathervane::Provider" do
    name "McWeather"
  end
end
