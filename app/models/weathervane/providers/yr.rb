# Adapter for Norwegian Meteorological Institute (met.no, yr.no)
module Weathervane
  module Providers
    class Yr < Weathervane::ForecastProvider
      self.table_name = "forecast_providers"

      self.uri_template = "http://api.met.no/weatherapi/locationforecast/1.8/?lat=%s;lon=%s;msl=0"

      def extract_forecasts(data)

        data = Nori.new(:parser => :nokogiri, :advanced_typecasting => false).parse(data)
        # @todo handle Nori parser errors




      end

    end
  end
end