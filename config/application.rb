require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Did
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    #config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    #config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]

    config.paths.add "app/api", glob: "**/*.rb"
    config.autoload_paths += Dir["#{Rails.root}/app/api/*"]

    config.middleware.use Rack::Cors do
      allow do
        origins "*"
        resource "*", headers: :any, methods: [:get,
                                               :post, :put, :delete, :options]
      end
    end
    config.active_record.raise_in_transactional_callbacks = true

  end
end

module SampleApp
  class Application < Rails::Application
    
    
    
    # 在使用 Ajax 处理的表单中添加真伪令牌
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end
