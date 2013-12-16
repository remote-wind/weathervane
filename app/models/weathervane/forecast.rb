module Weathervane
  class Forecast  < ActiveRecord::Base

    self.table_name = "forecasts"

    belongs_to :forecast_provider
    validates_numericality_of :latitude, :longitude, :wind_speed, :wind_direction, :wind_gust
    validates_numericality_of :wind_direction, less_than: 360

  end
end