require 'factory_girl'
require Rails.root + 'lib/weathervane/seeds'

Weathervane::Seeds::Providers.create(3)