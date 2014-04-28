Weathervane::Application.routes.draw do



  root to: "pages#home"

  resources :providers, only: [:show, :index] do
  end

  get ":provider/forecasts(.:format)(/:lat(/:lng))", to: "forecasts#index"

  # Any other routes are handled here (as ActionDispatch prevents RoutingError from hitting ApplicationController::rescue_action).
  match "*path", to: "application#route_not_found", via: :all

end
