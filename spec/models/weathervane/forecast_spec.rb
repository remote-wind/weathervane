require 'spec_helper'

describe Weathervane::Forecast do

  it { should respond_to :created_at }
  it { should respond_to :valid_from }
  it { should respond_to :valid_until }
  it { should respond_to :issued_at }
  it { should validate_numericality_of :speed }
  it { should validate_numericality_of :gust }
  it { should validate_numericality_of :direction }
  it { should validate_numericality_of :temperature }
  it { should validate_numericality_of :pressure }
  it { should_not allow_value(500).for(:direction) }

  let(:location) { build_stubbed( location ) }

  describe ".get_forecasts" do
    it "should raise a NotImplementedError" do
      expect {
        Weathervane::Forecast.get_forecasts(nil, nil)
      }.to raise_error(Weathervane::Errors::NotImplementedError, /must implement the class method get_forecasts/)
    end

  end


  describe ".new_from_provider_response" do
    it "should raise a NotImplementedError" do
      expect {
        Weathervane::Forecast.new_from_provider_response(nil, nil, nil)
      }.to raise_error(Weathervane::Errors::NotImplementedError, /must implement the class method new_from_provider_response/)
    end
  end

end
