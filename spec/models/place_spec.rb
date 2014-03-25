require 'spec_helper'

describe Place do

  it { should validate_presence_of :name }
  it { should validate_presence_of :district }
  it { should validate_presence_of :country }
  it { should validate_numericality_of :lat }
  it { should validate_numericality_of :lon }
  it { should validate_numericality_of :geoname_id }

  it "validates format of country_code" do
    expect {
      create(:place, country_code: 'AC721A')
    }.to raise_error(Mongoid::Errors::Validations, /Country code is invalid/)
  end
end