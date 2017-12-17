require_relative 'boot'

require 'rails/all'
require 'dotenv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SiteVisitServer
  class Application < Rails::Application
    Dotenv.load('.env', '.env.development', '.env.test')
    puts "tag info from env: #{ENV['TAG']} and db: #{ENV['DB_NAME']}"
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths << Rails.root.join('app/graphql/mutations')
    config.autoload_paths << Rails.root.join('app/graphql/types')
    config.autoload_paths << Rails.root.join('app/graphql/utils')
  end
end
