require 'spec_helper'

describe Forecast do

  it { should respond_to :created_at }
  it { should respond_to :valid_from }
  it { should respond_to :valid_until }
  it { should respond_to :issued_at }

  it_behaves_like "a weather unit"

  let(:location) { build_stubbed( location ) }

  describe ".get_forecasts" do
    it "should raise a NotImplementedError" do
      expect {
        Forecast.get_forecasts(nil, nil)
      }.to raise_error(Weathervane::Errors::NotImplementedError, /must implement the class method get_forecasts/)
    end
  end

  describe ".create_from_provider_response" do
    it "should raise a NotImplementedError" do
      expect {
        Forecast.create_from_provider_response(nil, nil, nil)
      }.to raise_error(Weathervane::Errors::NotImplementedError, /must implement the class method create_from_provider_response/)
    end
  end

end
