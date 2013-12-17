require 'spec_helper'

module Weathervane
  describe Providers::SMHI do

    let(:provider) { Weathervane::Providers::SMHI.new }
    let(:sample_data) { IO.read( File.dirname( __FILE__ ) + "/smhi_sample_data.json" )}

    specify "required sample data is available" do
      fn = File.dirname( __FILE__ ) + "/smhi_sample_data.json"
      expect(File.exists? fn).to be_true
    end

    describe "#extract_forecasts" do

      it "parses response data as JSON" do
        JSON.should_receive(:parse).with('{}')
        provider.extract_forecasts('{}')
      end

      it "handles json parse errors" do
        expect do
          provider.extract_forecasts('{/')
        end.to_not raise_error
      end

      it "creates forecasts from json data" do
        forecasts = provider.extract_forecasts(sample_data)
        expect(forecasts[0]).to be_a_kind_of Weathervane::Forecast
      end

      describe "attribute mapping" do
        subject { provider.extract_forecasts(sample_data)[0] }
        its(:valid_from)      { should eq Time.iso8601("2013-12-16T15:00:00Z") }
        its(:valid_until)     { should eq Time.iso8601("2013-12-16T16:00:00Z") }
        its(:reference_time)  { should eq Time.iso8601("2013-12-16T14:00:00Z") }
        its(:wind_speed)      { should eq 5.7 }
        its(:wind_gust)       { should eq 8.4 }
        its(:wind_direction)  { should eq 202 }
        its(:latitude)        { should eq 58.548703 }
        its(:longitude)       { should eq 16.155116 }
      end

    end
  end
end
