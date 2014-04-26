source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.3'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Addressable is a replacement for the URI implementation that is part of Ruby's standard library.
# It more closely conforms to the relevant RFCs and adds support for IRIs and URI templates.
gem 'addressable', '~> 2.3.6'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# ===== DB ===============================================================================

# Ruby Object Mapper for Mongo
gem 'mongoid', '4.0.0.beta1', github: 'mongoid/mongoid'

#C extensions to accelerate the Ruby BSON serialization.
gem 'bson_ext'

# Mongoid URL slug or permalink generator
gem 'mongoid_slug', '~> 3.2.1'


# ===== Test & Development ===============================================================

group :development do
  # Provides a better error page for Rails and other Rack apps.
  gem 'better_errors', '~> 1.1.0', require: false
  # Page loading speed displayed on every page.
  gem 'miniprofiler', '~> 0.1.7.4', require: false
  # Sends meta headers for RailsPanel in google chrome
  gem 'meta_request', require: false
  # Annotate models
  gem 'annotate', require: false
end

group :development, :test do
  #Loads environment variables from .env file
  gem 'dotenv-rails', '~> 0.10.0'
  # BDD for Ruby
  gem "rspec-rails" #, "~> 2.14.1"
  # A forking Drb spec server
  gem "spork-rails", "~> 4.0.0", require: false
  # Guard is a command line tool to easily handle events on file system modifications.
  gem "guard-spork", "~> 1.5.1", require: false
  gem "guard-rspec", "~> 4.2.8", require: false
  # Show test status indicators on Mac OS X
  gem "terminal-notifier-guard", "~> 1.5.3", require: false
  # factory_girl provides a framework and DSL for defining and using factories.
  gem "factory_girl_rails", "~> 4.4.1"
  # Matchers to make model specs easy on the fingers and eyes
  gem "shoulda-matchers", "~> 2.5.0"
  # WebMock allows stubbing HTTP requests and setting expectations on HTTP requests.
  gem 'webmock', '~> 1.17.4'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
