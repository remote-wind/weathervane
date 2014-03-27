require 'spec_helper'
require 'json'
require 'ostruct'

describe Weathervane::Location do

  it { should validate_presence_of :name }
  it { should validate_presence_of :district }
  it { should validate_presence_of :country }
  it { should validate_numericality_of :lat }
  it { should validate_numericality_of :lng }
  it { should validate_numericality_of :geoname_id }
  it { should allow_value("AA").for(:country_code) }
  it { should_not allow_value("AC721A").for(:country_code) }


  before(:each) do
    # Stub geonames lookup with Webmock
    stub_request(:any, Regexp.new(Regexp.quote('http://api.geonames.org/findNearbyPlaceNameJSON')))
    .to_return(:body => IO::read("#{Rails.root}/spec/mock_responses/geonames.json"), :status => 200)
  end


  describe ".get_reverse_lookup" do

    context "when request is OK" do

      it "should return an OpenStruct" do
        expect(Weathervane::Location.get_reverse_lookup(1,1)).to be_a_kind_of OpenStruct
      end
    end
  end

  describe ".create_from_geonames" do

    before(:all) do
      @response = IO::read("#{Rails.root}/spec/mock_responses/geonames.json")
      @response = OpenStruct.new( JSON.parse(@response)["geonames"].first )
    end

    subject(:location) { Weathervane::Location.new_from_geonames(@response) }
    its(:name) { should eq "Åre" }
    its(:country) { should eq "Sweden"}
    its(:country_code) { should eq "SE"}
    its(:district) { should eq "Jämtland"}
    its(:lat) { should eq 63.39835 }
    its(:lng) { should eq 13.08019 }
    its(:geoname_id) { should eq 2725432 }
  end

  describe ".find_or_create_by_lat_lng" do

    context "if location previously exists" do

      let!(:location) { create(:location, lat: 1, lng: 1 ) }

      it "should return the correct location" do
        expect(Weathervane::Location.find_or_create_by_lat_lng(1,1).id).to eq location.id
      end
    end

    context "when location does not exist" do

      let(:location) { Weathervane::Location.find_or_create_by_lat_lng(1,1) }

      it "should create a location" do
        expect {
          Weathervane::Location.find_or_create_by_lat_lng(2,2)
        }.to change(Weathervane::Location, :count).by(1)
      end
    end
  end
end