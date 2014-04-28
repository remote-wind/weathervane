require 'spec_helper'
require 'json'

describe ProvidersController do

  let(:provider) { create(:provider) }

  describe "GET 'show'" do

    it "can find provider from slug" do
      get :show, id: provider._slug
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
        expect(json["slug"]).to eq provider._slug
        expect(json["uri"]).to eq provider_url(provider.to_param)
      end
    end

    context "when provider is not found" do

      context "as HTML" do

        before(:each) { get :show, id: "does_not_exist" }

        it "returns 404" do
          expect(response.code).to eq "404"
        end

        it "assigns the correct @header" do
          expect(assigns(:header)).to eq "Provider could not be found"
        end

        it "assigns the correct @message" do
          expect(assigns(:message)).to eq "Sorry, could not find provider with the ID or SLUG 'does_not_exist'"
        end

      end

      context "as JSON" do
        render_views
        let(:json) do
          get :show, format: "json", id: "does_not_exist"
          JSON.parse(response.body)
        end

        it "includes an error message" do
          expect(json["error"]["message"]).to eq "Sorry, could not find provider with the ID or SLUG 'does_not_exist'"
        end
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
