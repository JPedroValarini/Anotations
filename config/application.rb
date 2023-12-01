require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Anotations
 class Application < Rails::Application
    config.load_defaults 7.0

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://localhost:8080'
        resource '*',
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options],
          credentials: true
      end
    end

    config.api_only = true
 end
end