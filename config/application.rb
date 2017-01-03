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

Bundler.require(*Rails.groups)

module BaseAppRails
  class Application < Rails::Application
    config.action_cable.url = "#{ENV['ACTION_CABLE_FRONTEND_HOST']}/cable"
    origins = ENV['ACTION_CABLE_ALLOWED_REQUEST_ORIGINS'].split(',')
    origins.map! { |url| /#{url}/ }
    config.action_cable.allowed_request_origins = origins
  end
end
