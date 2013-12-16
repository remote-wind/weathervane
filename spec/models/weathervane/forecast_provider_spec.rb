require "spec_helper"

describe Weathervane::ForecastProvider do
  it { should have_many :forecasts }
end