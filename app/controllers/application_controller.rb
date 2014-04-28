class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  rescue_from "Mongoid::Errors::DocumentNotFound",
              "ActionController::RoutingError",
              with: lambda { |e| not_found e }

  def not_found exception
    @header ||= nil
    @message ||= exception.message
    render "application/not_found", status: :not_found
  end

  def route_not_found
    @header ||= "Sorry."
    @message ||= "Cannot find a route to <em>#{request.fullpath}</em>".html_safe
    render "application/not_found", status: :not_found
  end

end