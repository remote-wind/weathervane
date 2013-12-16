require_dependency "weathervane/application_controller"

module Weathervane
  class ForecastsController < ApplicationController

    # GET /forecasts/:provider
    def show_for_provider

      case params[:provider]
        when 'smhi'
          @provider = Weathervane::Providers::Smhi
          @forecasts = @provider.get_forecasts(params[:lat],params[:lon])
      end



    end
  end
end
