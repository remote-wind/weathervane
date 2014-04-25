# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :provider, class: "Provider" do
    name "McWeather"
    slug "mcweather"
  end

  factory :smhi_provider, class: "Providers::SMHI" do
    name "Swedish Metrological and Hydrological Institure"
    slug "smhi"
  end

end
