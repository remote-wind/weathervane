require 'spec_helper'

describe Weathervane::Seeds do

  describe Weathervane::Seeds::Providers do
    describe ".seed" do
      it "creates SMHI" do
        Weathervane::Seeds::Providers.seed
        expect(Weathervane::Provider.find('smhi')).to be_a Weathervane::Providers::SMHI
      end
    end
  end

end
