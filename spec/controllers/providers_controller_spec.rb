require 'spec_helper'
require 'json'

describe ProvidersController do

  let(:provider) { create(:provider) }

  describe "GET 'show'" do

    it "can find provider from slug" do
      get :show, id: provider.slug
      expect(response).to be_success
    end

    context "as JSON" do
      render_views

      let(:json) do
        get :show, format: "json", id: provider.to_param
        JSON.parse(response.body)
      end

      it "has the correct attributes" do
        expect(json["id"]).to eq provider.id.to_s
        expect(json["name"]).to eq provider.name
        expect(json["slug"]).to eq provider.slug
        expect(json["uri"]).to eq provider_url(provider.to_param)
      end
    end
  end
  
  describe "GET 'index'" do

    let(:providers) { [provider] }

    it "returns http success" do
      get :index
      expect(response).to be_success
    end

    context "as JSON" do
      render_views

      let(:json) do
        get :index, format: "json"
        JSON.parse(response.body)
      end

      it "has the correct number of providers" do
        providers
        expect(json.size).to eq providers.size
      end

      it "renders provider correctly" do
        providers
        expect(json.first["id"]).to eq providers.first.id.to_s
      end
    end
  end
end
