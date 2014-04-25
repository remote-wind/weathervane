class Weathervane::Provider
  include Mongoid::Document
  include Mongoid::Slug

  # Fields
  field :name, type: String
  slug :slug, history: false

  # Virtual atttributes
  attr_accessor :slug

  # Validations
  validates_uniqueness_of :name

  # Relations
  has_many :forecasts, class_name: 'Weathervane::Forecast'


  # Available services such as forecasts and observations
  # Each key should be a reference to the class which can be used to fetch the resource
  # ex. forecasts: Weathervane::Forecast
  SERVICES = {}

  def self.services
    self::SERVICES
  end

end