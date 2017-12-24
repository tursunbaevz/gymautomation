require File.expand_path('../boot', __FILE__)


require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Gymautomation
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    # config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.time_zone = 'Almaty' #GMT +6

   # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
   config.i18n.enforce_available_locales = false
   # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
   # config.i18n.default_locale = :de
   config.assets.paths << "#{Rails}/vendor/assets/fonts"    
   
   config.active_record.raise_in_transactional_callbacks = true

   config.autoload_paths += Dir[Rails.root.join('app', 'models', '{**/}')]
   config.autoload_paths += Dir[Rails.root.join('lib', '{**/}')]
  end
end
