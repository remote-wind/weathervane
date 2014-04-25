Weathervane::Application.routes.draw do

  get "pages/home"
  resources :providers do
  end

  get ":provider/forecasts(.:format)(/:lat(/:lng))", to: "forecasts#index"

end
