require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
I18n.available_locales = %i[en ja]
I18n.default_locale = :en

module MyBlog
  class Application < Rails::Application
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :put]
      end
    end
    config.load_defaults 5.1
  end
end
