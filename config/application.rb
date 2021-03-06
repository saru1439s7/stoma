require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Stoma
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.i18n.default_locale = :ja
    config.paths.add 'lib', eager_load: true # 追加
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end


  # config.generators do |g|
  #   # Railsジェネレータがfactory_bot用のファイルを生成するのを無効化
  #   g.factory_bot false
  #   # ファクトリファイルの置き場を変更
  #   g.factory_bot dir: 'custom/dir/for/factories'
  # end

end
