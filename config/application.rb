require File.expand_path('../boot', __FILE__)

require 'rails/all'
require File.expand_path('../../app/realtime/client_event.rb', __FILE__)

Bundler.require(:default, Rails.env)

module Ratab
  class Application < Rails::Application
    config.i18n.default_locale = "zh-CN"
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    config.assets.paths << Rails.root.join("vendor", "assets", "fonts")

    # faye server
    config.middleware.use FayeRails::Middleware, mount: '/faye', :timeout => 25 do
      map '/notify/**' => NotifyController  
      map default: NotifyController

      add_extension(ClientEvent.new)
    end
    config.middleware.delete Rack::Lock
  end
end
