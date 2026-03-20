require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Moneydog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    config.time_zone = "Prague"
    config.i18n.default_locale = :cs
    config.i18n.load_path += Dir[Rails.root.join("config/locales/**/*.{rb,yml}")]

    # Filter sensitive parameters from the log
    config.filter_parameters += [:password, :password_confirmation]
  end
end
