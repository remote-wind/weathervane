require 'spec_helper'

describe Weathervane::Observation do

  it { should respond_to :created_at }

  it_behaves_like "a weather unit"

end
