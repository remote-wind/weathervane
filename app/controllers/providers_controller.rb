class ProvidersController < ApplicationController

  def show
    @provider = Weathervane::Provider.find(params[:id])
  end

  def index
    @providers = Weathervane::Provider.all
  end
end