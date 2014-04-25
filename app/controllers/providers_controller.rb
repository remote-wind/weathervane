class ProvidersController < ApplicationController

  # GET /providers/:id
  def show
    @provider = Weathervane::Provider.find(params[:id])
  end

  # GET /providers
  def index
    @providers = Weathervane::Provider.all
  end
end