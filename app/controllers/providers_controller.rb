class ProvidersController < ApplicationController

  # GET /providers/:id
  def show
    @provider = Provider.find(params[:id])
  end

  # GET /providers
  def index
    @providers = Provider.all
  end
end