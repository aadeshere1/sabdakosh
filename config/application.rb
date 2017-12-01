require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "csv"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Sadbakosh
  class Application < Rails::Application
    Raven.configure do |config|
      config.dsn = 'https://fcc1715e06ac4fdc9ded1b195516d806:ac32d65ec4fe4e2eb73de8e81162a432@sentry.io/253174'
    end
  end
end
