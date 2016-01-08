require 'digest/sha1'
require 'rack/utils'
require 'rack/cache/key'
require 'rack/cache/metastore'
require 'redis-rack-cache/constants'

module Rack
  module Cache
    class MetaStore
      class RedisBase < self
        extend Rack::Utils

        # The Redis::Store object used to communicate with the Redis daemon.
        attr_reader :cache

        def self.resolve(uri)
          new ::Redis::Store::Factory.resolve(uri.to_s)
        end
      end

      class Redis < RedisBase
        # The Redis instance used to communicated with the Redis daemon.
        attr_reader :cache

        def initialize(server, options = {})
          @cache = ::Redis::Store::Factory.create(server)
        end

        def read(key)
          cache.get(hexdigest(key)) || []
        end

        def write(key, entries, ttl=0)
          ttl = ::Redis::Rack::Cache::DEFAULT_TTL if ttl.zero?
          cache.setex(hexdigest(key), ttl, entries)
        end

        def purge(key)
          cache.del(hexdigest(key))
          nil
        end
      end

      REDIS = Redis
    end
  end
end
