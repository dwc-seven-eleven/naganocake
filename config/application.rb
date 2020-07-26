require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Naganocake
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    #railsが表示の際に扱うタイムゾーン
    config.time_zone = 'Tokyo'

    #rails(Activerecord)がDBへのRead.Writeを行う際のタイムゾーン
    config.active_record.default_timezone = :local

  end
end
