require 'spec_helper'

describe Weathervane::Seeds do

  describe Weathervane::Seeds::Providers do
    describe ".seed" do
      it "creates SMHI" do
        Weathervane::Seeds::Providers.seed
        expect(Weathervane::Provider.where(name: 'SMHI').count).to eq 1
      end
    end
  end

end
