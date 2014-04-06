# Represents actual weather observations gathered by a provider for a given location
class Weathervane::Observation < Weathervane::WeatherUnit

  include Mongoid::Timestamps::Created

end