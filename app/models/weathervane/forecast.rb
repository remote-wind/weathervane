class Weathervane::Forecast
  include Mongoid::Document
  include Mongoid::Timestamps::Created # Adds created_at field

  belongs_to :provider, class_name: 'Weathervane::Provider'
  belongs_to :location, class_name: 'Weathervane::Location'

  field :valid_from, type: Time
  field :valid_until, type: Time
  field :issued_at, type: Time
  field :speed, type: Float # M/S
  field :gust, type: Float # M/S
  field :direction, type: Float # degrees
  field :temperature, type: Float # degrees centigrade
  field :pressure, type: Float # hPa

  validates_numericality_of :speed, :gust, :temperature, :pressure, allow_nil: true
  validates :direction, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 360, allow_nil: true}

  # Subclasses should implement get_forecasts with the following signature
  # @abstract
  # @param location Weathervane::Location
  # @param location Weathervane::Provider
  # @return array
  def self.get_forecasts(location, provider = nil)
    raise Weathervane::Errors::NotImplementedError, "#{self.name} must implement the class method get_forecasts"
  end

  # Subclasses should implement create_from_provider_response with the following signature
  # @param location Weathervane::Location
  # @param provider Weathervane::Provider
  # @param response OpenStruct
  # @return Weathervane::Forecast
  def self.create_from_provider_response(location, provider, response)
    raise Weathervane::Errors::NotImplementedError, "#{self.name} must implement the class method create_from_provider_response"
  end

end