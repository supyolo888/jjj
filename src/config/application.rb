require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.generators do |g|
      g.test_framework :rspec,
      view_specs: false,
      helper_specs: false,
      routing_specs: false
    end

    config.hosts.clear

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # 認証トークンをremoteフォームに埋め込む
    config.action_view.embed_authenticity_token_in_remote_forms = true
    config.action_view.form_with_generates_remote_forms = true
  end
end
