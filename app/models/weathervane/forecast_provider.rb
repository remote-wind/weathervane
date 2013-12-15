module Weathervane
  class ForecastProvider < ActiveRecord::Base
    self.table_name = "forecast_providers"
    has_many :forecasts, class_name: 'Weathervane::Forecast'
  end
end

