module SpreeNameKana
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_name_kana'

    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'spree_name_kana.environment', before: :load_config_initializers do |_app|
      SpreeNameKana::Config = SpreeNameKana::Configuration.new
    end

    config.to_prepare do
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      Rails.application.config.paths["app/views"].unshift(File.join(Rails.root, "app/views"))
    end
  end
end
