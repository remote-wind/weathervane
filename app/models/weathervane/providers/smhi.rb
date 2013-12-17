# Adapter for Swedish Meteorological and Hydrological Institute
# ! This API is a beta.
require 'net/http'
module Weathervane
  module Providers
    class SMHI < Weathervane::ForecastProvider
      self.table_name = "forecast_providers"
      self.uri_template = "http://opendata-download-metfcst.smhi.se/api/category/pmp1g/version/1/geopoint/lat/%s/lon/%s/data.json"

      def extract_forecasts data
        begin
          data = JSON.parse data
        rescue JSON::ParserError => e
          # @todo re-raise and log error
        end

        if data && data['timeseries']
          forecasts = data['timeseries'].map do |f|
            Forecast.new({
               reference_time:  data['referenceTime'],
               valid_from:      Time.iso8601(f['validTime']),
               valid_until:     Time.iso8601(f['validTime']) + 3600,
               wind_speed:      f['ws'],
               wind_gust:       f['gust'],
               wind_direction:  f['wd'],
               latitude:        data['lat'],
               longitude:       data['lon'],
            })
          end
        end
      end

    end
  end
end
