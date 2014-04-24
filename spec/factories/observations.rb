# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :observation, class: 'Weathervane::Observation' do
    speed 1.5
    gust 1.5
    direction 1.5
    temperature 40
    pressure 1000
  end
end
