require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Curve
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    # sitepoint devise tutorial, to send e-mail with delayed_job
    # config.active_job.queue_adapter = :delayed_job
    # TODO: delayed_job'u düzelt sonra
    # sitepoint 2015 redis tutorial, to config the cache store
    # config.cache_store = :redis_store, 'redis://localhost:6379/0/cache', { expires_in: 90.minutes }
    # from follow tutorial
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end
