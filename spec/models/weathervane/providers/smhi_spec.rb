require 'spec_helper'

module Weathervane
  describe Providers::Smhi do

    describe ".get_forecasts" do
      let(:uri) { 'http://opendata-download-metfcst.smhi.se/api/category/pmp1g/version/1/geopoint/lat/10/lon/10/data.json' }
      let(:response) { stub_request(:get, uri) }

      it "requests the correct url" do
        response
        Providers::Smhi.get_forecasts(10,10)
        WebMock.should have_requested(:get, uri)
      end

      it "calls parse_forecasts" do
        response.to_return(:status => 200, :body => '{}', :headers => {})
        Providers::Smhi.should_receive(:parse_forecasts).with('{}')
        Providers::Smhi.get_forecasts(10,10)
      end
    end

    describe ".parse_forecasts" do

      let(:sample_data) { IO.read( File.dirname( __FILE__ ) + "/smhi_sample_data.json" )}

      it "parses response data as JSON" do
        JSON.should_receive(:parse).with('{}')
        Providers::Smhi.parse_forecasts('{}')
      end

      it "handles json parse errors" do
        expect do
          Providers::Smhi.parse_forecasts('{/')
        end.to_not raise_error
      end

      it "creates forecasts from json data" do
        forecasts = Providers::Smhi.parse_forecasts(sample_data)
        expect(forecasts[0]).to be_a_kind_of Weathervane::Forecast
      end

      describe "attribute mapping" do
        subject { Providers::Smhi.parse_forecasts(sample_data)[0] }
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
