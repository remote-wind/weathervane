require 'spec_helper'
require 'json'
require 'ostruct'

describe Forecasts::SMHI do

  let(:data) { IO::read("#{Rails.root}/spec/mock_responses/smhi_forecast.json") }
  let(:provider) { build_stubbed(:provider) }
  let(:location) { build_stubbed(:location) }

  before(:each) do
    # Stub geonames lookup with Webmock
    stub_request(:any, Regexp.new(Regexp.quote(Forecasts::SMHI::API_BASE_URI)))
      .to_return(body: data, status: 200)
  end

  describe ".get_forecasts" do

    let(:forecasts) { Forecasts::SMHI.get_forecasts(build_stubbed(:location, lat: 10, lng: 10)) }

    it "should request the correct url" do
      forecasts
      WebMock.should have_requested( :get,
         'http://opendata-download-metfcst.smhi.se/api/category/pmp1.5g/version/1/geopoint/lat/?lat=10.0/lon/?lon=10.0/data.json')
    end

    it "should create forecasts from json response" do
      expect {
        forecasts
      }.to change(Forecasts::SMHI, :count).by(3)
    end

    it "should return forecasts" do
      expect(forecasts.length ).to eq 3
    end

  end

  describe ".create_from_provider_response" do

    let(:response) do
      response = JSON[data]
      response['timeseries'].first[:issued_at] = response['referenceTime']
      response['timeseries'].first
    end

    subject do
      Forecasts::SMHI.create_from_provider_response(location, provider, response)
    end

    its(:issued_at) { should eq Time.iso8601("2014-03-27T10:00:00Z") }
    its(:valid_from) { should eq Time.iso8601("2014-03-27T10:00:00Z") }
    its(:valid_until) { should eq Time.iso8601("2014-03-27T11:00:00Z") }
    its(:speed) { should eq 2.9 }
    its(:gust) { should eq 6.1 }
    its(:direction) { should eq 51 }
    its(:temperature) { should eq 7.1 }
    its(:pressure) { should eq 1026.4 }
    its(:provider) { should eq provider }
    its(:location) { should eq location }
  end
end
