$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "weathervane/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "weathervane"
  s.version     = Weathervane::VERSION
  s.authors     = ["Max Calabrese"]
  s.email       = ["max.calabrese@ymail.com"]
  s.homepage    = "http://www.github.com/remote-wind/weathervane"
  s.summary     = "Weathervane is a rails plugin which consumes weather forecasts from various providers and map to
a common forecast model. Thus abstracting out the complexity of dealing with various providers."
  s.description = "Weather api consumer."

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "readme.MD"]

  s.add_dependency "rails", "~> 4.0.2"
  s.add_dependency "nokogiri"
  s.add_dependency "nori"
  s.add_dependency "jbuilder"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-spork"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "webmock"
end