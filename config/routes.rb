Weathervane::Engine.routes.draw do

  get '/forecasts/:provider/:lat/:lon', to: "forecasts#show_for_provider"

end
