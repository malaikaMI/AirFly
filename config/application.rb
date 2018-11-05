require File.expand_path("../boot", __FILE__)
require "rails/all"

Bundler.require(*Rails.groups)

module Balu
  class Application < Rails::Application
    config.generators.test_framework = :rspec
    config.generators.fixture_replacement :factory_girl
    config.active_record.raise_in_transactional_callbacks = true
  end
end
