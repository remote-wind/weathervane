# Defines base attributes common to both observations and forecasts
class WeatherUnit

  include Mongoid::Document

  belongs_to :provider, class_name: 'Provider'
  belongs_to :location, class_name: 'Location'

  field :speed, type: Float # M/S
  field :gust, type: Float # M/S
  field :direction, type: Float # degrees
  field :temperature, type: Float # degrees centigrade
  field :pressure, type: Float # hPa MSL

  validates_numericality_of :speed, :gust, :temperature, :pressure, allow_nil: true
  validates :direction, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 360, allow_nil: true}

end