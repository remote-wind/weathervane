source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.3'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Ruby Object Mapper for Mongo
gem 'mongoid', '4.0.0.beta1', github: 'mongoid/mongoid'
gem 'bson_ext'

#Loads environment variables from .env file
gem "dotenv", "~> 0.10.0"

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
end