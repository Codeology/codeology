require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Codeology
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    # Overrides field_with_error from appearing, thus preventing it from changing
    # the signin/signup page layouts when an error occurs (eg from bad pw or email)
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| 
      html_tag
    }
  end
end
