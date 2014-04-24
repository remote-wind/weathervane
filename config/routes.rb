Weathervane::Application.routes.draw do

  resources :providers do
  end

  get ":provider/forecasts(.:format)(/:lat(/:lng))", to: "forecasts#index"

end
