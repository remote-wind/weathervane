class Forecast < WeatherUnit

  include Mongoid::Timestamps::Created

  field :valid_from, type: Time
  field :valid_until, type: Time
  field :issued_at, type: Time

  # Subclasses should implement get_forecasts with the following signature
  # @raise Weathervane::Errors::NotImplementedError
  # @param location Location
  # @param location Provider
  # @return array
  def self.get_forecasts(location, provider = nil)
    raise Weathervane::Errors::NotImplementedError,
          "#{self.name} must implement the class method get_forecasts"
  end

  # Subclasses should implement create_from_provider_response with the following signature
  # @raise Weathervane::Errors::NotImplementedError
  # @param location Location
  # @param provider Provider
  # @param response Hash
  # @return Forecast
  def self.create_from_provider_response(location, provider, response)
    raise Weathervane::Errors::NotImplementedError,
          "#{self.name} must implement the class method create_from_provider_response"
  end

end