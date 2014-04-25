Weathervane::Application.routes.draw do


  root to: "pages#home"

  resources :providers, only: [:show, :index] do
  end

  get ":provider/forecasts(.:format)(/:lat(/:lng))", to: "forecasts#index"

end
