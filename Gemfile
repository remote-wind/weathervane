source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.3'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# ===== DB ===============================================================================

# Ruby Object Mapper for Mongo
gem 'mongoid', '4.0.0.beta1', github: 'mongoid/mongoid'

#C extensions to accelerate the Ruby BSON serialization.
gem 'bson_ext'

#Loads environment variables from .env file
gem "dotenv", "~> 0.10.0"


# ===== Test & Development ===============================================================

group :development do
  # Provides a better error page for Rails and other Rack apps.
  gem 'better_errors', '~> 1.1.0'
  # Page loading speed displayed on every page.
  gem 'miniprofiler', '~> 0.1.7.4'
  # Sends meta headers for RailsPanel in google chrome
  gem 'meta_request'
  # Annotate models
  gem 'annotate'
end

group :development, :test do
  # BDD for Ruby
  gem "rspec-rails" #, "~> 2.14.1"
  # A forking Drb spec server
  gem "spork-rails", "~> 4.0.0"
  # Guard is a command line tool to easily handle events on file system modifications.
  gem "guard-spork", "~> 1.5.1"
  gem "guard-rspec", "~> 4.2.8"
  # Show test status indicators on Mac OS X
  gem "terminal-notifier-guard", "~> 1.5.3", require: false
  # factory_girl provides a framework and DSL for defining and using factories.
  gem "factory_girl_rails", "~> 4.4.1"
  # Matchers to make model specs easy on the fingers and eyes
  gem "shoulda-matchers", "~> 2.5.0"
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
