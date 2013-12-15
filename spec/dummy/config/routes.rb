Rails.application.routes.draw do

  mount Weathervane::Engine => "/weathervane"
end
