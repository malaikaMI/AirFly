require File.expand_path("../boot", __FILE__)
require "rails/all"

Bundler.require(*Rails.groups)

module AirFly
  class Application < Rails::Application
    config.generators.test_framework = :rspec
    config.generators.fixture_replacement :factory_girl
    config.active_record.raise_in_transactional_callbacks = true
    # config/application.rb
    config.assets.initialize_on_precompile = false
  end
end
