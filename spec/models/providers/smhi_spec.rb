require 'spec_helper'

describe Providers::SMHI do


  describe ".attributes_for" do

    it "gives the correct name" do
      expect(Providers::SMHI.attributes_for[:name]).to eq "Swedish Metrological and Hydrological Institure"
    end

    it "gives the correct slug" do
      expect(Providers::SMHI.attributes_for[:slug]).to eq "smhi"
    end

  end

  describe ".create" do
    it "overrides .create" do
      provider = Providers::SMHI.create
      expect(provider.name).to eq "Swedish Metrological and Hydrological Institure"
      expect(provider._slugs.first).to eq "smhi"
    end
  end

  describe ".new" do
    it "overrides .new" do
      provider = Providers::SMHI.new
      expect(provider.name).to eq "Swedish Metrological and Hydrological Institure"
      expect(provider.slug).to eq "smhi"
    end
  end

  it "has a forecasts service" do
    expect(Providers::SMHI.services[:forecasts]).to eq Forecasts::SMHI
  end

end
