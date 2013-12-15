require "spec_helper"

describe Weathervane::Forecast do

  it { should belong_to :forecast_provider }
  it { should respond_to :valid_from }
  it { should respond_to :valid_until }
  it { should validate_numericality_of :latitude }
  it { should validate_numericality_of :longitude }
  it { should validate_numericality_of(:wind_direction).is_less_than(360) }
  it { should validate_numericality_of :wind_velocity }
  it { should validate_numericality_of :wind_gust }

end