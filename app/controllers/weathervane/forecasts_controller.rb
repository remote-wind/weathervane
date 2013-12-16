require_dependency "weathervane/application_controller"

module Weathervane
  class ForecastsController < ApplicationController

    # GET /forecasts/:provider
    def show_for_provider
      @provider = Weathervane::ForecastProvider.new

    end
  end
end
