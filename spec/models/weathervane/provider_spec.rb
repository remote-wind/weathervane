require 'spec_helper'

describe Weathervane::Provider do

  it { should validate_uniqueness_of :name }
  it { should respond_to :forecasts }

  it "should have the correct slug" do
    provider = Weathervane::Provider.create(name: "foobar", slug: 'foo')
    expect(provider._slugs.first).to eq "foo"
  end

end