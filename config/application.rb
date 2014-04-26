require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env)

module Ratab
  class Application < Rails::Application
    config.i18n.default_locale = "zh-CN"
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    config.assets.paths << Rails.root.join("vendor", "assets", "fonts")
  end
end
