require 'spec_helper'

describe Weathervane::Provider do

  it { should validate_uniqueness_of :name }
  it { should respond_to :forecasts }

  it "should have the correct slug" do
    provider = Weathervane::Provider.create(name: "foobar", slug: 'foo')
    expect(provider._slugs.first).to eq "foo"
  end

  describe ".attributes_for" do
    it "should raise a NotImplementedError" do
      expect {
        Weathervane::Provider.attributes_for
      }.to raise_error(Weathervane::Errors::NotImplementedError, /must implement the class method attributes_for/)
    end
  end

  describe "#services" do
    it "returns a hash" do
      provider = Weathervane::Provider.new
      expect(provider.services).to be_a Hash
    end
  end

end