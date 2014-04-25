require 'spec_helper'

describe ForecastsController do

  describe "GET 'index'" do



    it "returns http success" do
      get 'index', provider: 'foo', lat: 10, lng: 10
      response.should be_success
    end

  end
end
