Weathervane::Application.configure do

  env = Weathervane::Env
  # Settings specified here will take precedence over those in config/application.rb.
  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = env[:CONFIG_CACHE_CLASSES].or false

  # Do not eager load code on boot.
  config.eager_load = env[:CONFIG_EAGER_LOAD].or false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = env[:CONFIG_CONSIDER_ALL_REQUESTS_LOCAL].or true
  config.action_controller.perform_caching = env[:CONFIG_ACTION_CONTROLLER_PERFORM_CACHING].or false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = env[:CONFIG_ACTION_MAILER_RAISE_DELIVERY_ERROR].or false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = env[:CONFIG_ACTIVE_SUPPORT_DEPRECATION].or(:log).to_s

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = env[:CONFIG_ASSETS_DEBUG].or true
end