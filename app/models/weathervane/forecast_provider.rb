module Weathervane
  class ForecastProvider < ActiveRecord::Base
    self.table_name = "forecast_providers"
    has_many :forecasts, class_name: 'Weathervane::Forecast'
    class_attribute :uri_template

    def get_forecasts(lat, lon)
      uri = URI.encode( self.uri_template % [lat, lon])
      response = Net::HTTP.get_response(URI(uri))

      case response
        when Net::HTTPSuccess then
          if response.body
            return self.extract_forecasts(response.body)
          end
        # @todo handle error responses
        else

      end

    end

  end
end

