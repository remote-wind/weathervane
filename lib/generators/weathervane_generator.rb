require 'rails/generators'

module Weathervane

  module Generators
    class WeathervaneGenerator < Rails::Generators::NamedBase

      source_root File.expand_path('../templates', __FILE__)

      def init
        copy_file "create_forecast_providers.rb", "db/migrate/create_forecast_providers"
        copy_file "create_forecasts.rb", "db/migrate/create_forecast"
      end
    end
  end
end