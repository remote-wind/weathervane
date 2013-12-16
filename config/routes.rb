Weathervane::Engine.routes.draw do

  get '/forecasts/:provider', to: "forecasts#show_for_provider"

end
