require 'spec_helper'
require 'json'

describe "providers/provider.json.jbuilder" do

  let(:provider) { build_stubbed(:provider) }
  let!(:json) do
    render
    JSON.parse(rended)
  end



end