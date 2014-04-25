# Represents actual weather observations gathered by a provider for a given location
class Observation < WeatherUnit

  include Mongoid::Timestamps::Created

end