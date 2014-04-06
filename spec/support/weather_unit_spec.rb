shared_examples "a weather unit" do

  it { should validate_numericality_of :speed }
  it { should validate_numericality_of :gust }
  it { should validate_numericality_of :direction }
  it { should validate_numericality_of :temperature }
  it { should validate_numericality_of :pressure }
  it { should_not allow_value(-1).for(:direction) }
  it { should_not allow_value(361).for(:direction) }
  it { should allow_value(1).for(:direction) }

  it { should respond_to :location }
  it { should respond_to :provider }

end
