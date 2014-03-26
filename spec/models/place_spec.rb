require 'spec_helper'

describe Place do

  it { should validate_presence_of :name }
  it { should validate_presence_of :district }
  it { should validate_presence_of :country }
  it { should validate_numericality_of :lat }
  it { should validate_numericality_of :lon }
  it { should validate_numericality_of :geoname_id }
  it { should allow_value("AA").for(:country_code) }
  it { should_not allow_value("AC721A").for(:country_code) }

end