class Weathervane::Forecast < Weathervane::WeatherUnit

  include Mongoid::Timestamps::Created

  field :valid_from, type: Time
  field :valid_until, type: Time
  field :issued_at, type: Time

  # Subclasses should implement get_forecasts with the following signature
  # @param location Weathervane::Location
  # @param location Weathervane::Provider
  # @return array
  def self.get_forecasts(location, provider = nil)
    raise Weathervane::Errors::NotImplementedError,
          "#{self.name} must implement the class method get_forecasts"
  end

  # Subclasses should implement create_from_provider_response with the following signature
  # @param location Weathervane::Location
  # @param provider Weathervane::Provider
  # @param response Hash
  # @return Weathervane::Forecast
  def self.create_from_provider_response(location, provider, response)
    raise Weathervane::Errors::NotImplementedError,
          "#{self.name} must implement the class method create_from_provider_response"
  end

end