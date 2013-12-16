require 'net/http'

module Weathervane

  class Providers::Smhi < Weathervane::ForecastProvider
    self.table_name = "forecast_providers"

    URI_TEMPLATE = "http://opendata-download-metfcst.smhi.se/api/category/pmp1g/version/1/geopoint/lat/%s/lon/%s/data.json"

    def self.get_forecasts(lat, lon)

      uri = URI.encode( URI_TEMPLATE % [lat, lon])
      response = Net::HTTP.get_response(URI(uri))

      case response
        when Net::HTTPSuccess then
          if response.body
            self.parse_forecasts(response.body)
          end
        # @todo handle error responses
      else
      end
    end

    def self.parse_forecasts response

      begin
        data = JSON.parse response
      rescue JSON::ParserError => e
        # @todo re-raise and log error
      end

      if data && data['timeseries']

        forecasts = data['timeseries'].map do |f|
          Forecast.new({
            valid_from: Time.iso8601(f['validTime']),
            valid_until: Time.iso8601(f['validTime']) + 3600,
            wind_speed: f['ws'],
            wind_gust: f['gust'],
            wind_direction: f['wd'],
            latitude: data['lat'],
            longitude: data['lon']
          })
        end
      end
    end

  end
end
