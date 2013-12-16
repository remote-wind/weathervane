require 'spec_helper'

module Weathervane
  describe ForecastsController do

    routes { Weathervane::Engine.routes }

    describe "GET 'show_for_provider'" do
      it "returns http success" do
        get 'show_for_provider', provider: "smhi"
        expect(response).to be_success
      end
    end

  end
end
