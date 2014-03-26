require 'spec_helper'

describe Forecast do

  it { should respond_to :created_at }
  it { should respond_to :valid_from }
  it { should respond_to :valid_until }
  it { should respond_to :issued_at }
  it { should validate_numericality_of :speed }
  it { should validate_numericality_of :gust }
  it { should validate_numericality_of :direction }
  it { should validate_numericality_of :temperature }
  it { should validate_numericality_of :pressure }
  it { should_not allow_value(500).for(:direction) }

end
