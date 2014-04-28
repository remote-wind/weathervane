class ProvidersController < ApplicationController

  # GET /providers/:id
  def show
    @provider = Provider.find(params[:id])
  end

  # GET /providers
  def index
    @providers = Provider.all
  end

  def not_found e
    @header = "Provider could not be found"
    @message = "Sorry, could not find provider with the ID or SLUG '#{params[:id]}'"
    super e
  end

end