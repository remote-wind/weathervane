require 'spec_helper'
module Weathervane
  describe Providers::Yr do

    let(:provider) { Weathervane::Providers::Yr.new }
    let(:sample_data) { IO.read( File.dirname( __FILE__ ) + "/nmi_sample_data.xml" )}

    specify "required sample data is available" do
      fn = File.dirname( __FILE__ ) + "/nmi_sample_data.xml"
      expect(File.exists? fn).to be_true
    end

    describe "#extract_forecasts" do




    end
  end
end