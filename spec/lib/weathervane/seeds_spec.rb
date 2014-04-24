require 'spec_helper'

describe Weathervane::Seeds do

  describe Weathervane::Seeds::Providers do
    describe ".create" do
      it "creates the correct number of providers" do
        expect {
          Weathervane::Seeds::Providers.create(2)
        }.to change(Weathervane::Provider, :count).by(2)
      end
    end
  end

  describe Weathervane::Seeds::Forecasts do
    describe ".create" do
      it "creates the correct number of forecasts" do
        #Seeds::Forecasts.create(2)
      end
    end
  end
end
