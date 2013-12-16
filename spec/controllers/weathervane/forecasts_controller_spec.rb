require 'spec_helper'

module Weathervane
  describe ForecastsController do


    routes { Weathervane::Engine.routes }

    describe "GET 'show_for_provider'" do

      before :each do
        stub_request(:get, /.*opendata-download-metfcst\.smhi\.se.*/).to_return(:status => 200, :body => "", :headers => {})
      end

      it "returns http success" do
        get 'show_for_provider', provider: "smhi", lat: 10, lon: 10
        expect(response).to be_success
      end

      it "gets forecasts from smhi" do
        Weathervane::Providers::Smhi.stub(:get_forecasts).and_return(['foo'])
        get 'show_for_provider', provider: "smhi", lat: 10, lon: 10
        expect(assigns(:forecasts)).to eq ["foo"]
      end

    end

  end
end
