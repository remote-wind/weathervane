require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  ENV["RAILS_ENV"] ||= 'test'
  $:<< File.join(File.dirname(__FILE__), '..')
  require File.expand_path("../dummy/config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'shoulda-matchers'
  require 'webmock/rspec'
  require 'weathervane'
  require 'factory_girl'
  include Shoulda::Matchers::ActiveModel
  include FactoryGirl::Syntax::Methods
end

Spork.each_run do
  # This code will be run each time you run your specs.

end





