require 'spec_helper'

describe Weathervane::Providers::SMHI do

  it "has a forecasts service" do
    expect(Weathervane::Providers::SMHI.services[:forecasts]).to eq Weathervane::Forecasts::SMHI
  end

end
