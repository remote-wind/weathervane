class Weathervane::Provider
  include Mongoid::Document
  field :name, type: String

  has_many :forecasts

end