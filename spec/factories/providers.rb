# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :provider, class: "Provider" do
    name "McWeather"
    _slug "mcweather"
  end

  factory :smhi_provider, class: "Providers::SMHI" do
    name "Swedish Metrological and Hydrological Institure"
    _slug "smhi"
  end

end
