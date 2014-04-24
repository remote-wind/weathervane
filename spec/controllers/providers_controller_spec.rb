require 'spec_helper'

describe ProvidersController do


  let(:provider) { create(:provider) }

  describe "GET 'show'" do
    it "returns http success" do
      get :show, id: provider.to_param
      expect(response).to be_success
    end
  end
  
  describe "GET 'index'" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

end
