$redis = Redis::Namespace.new("curve", :redis => Redis.new(:password => ENV["REDIS_PASSWORD"]))
#$redis = Redis.new(:password => ENV["REDIS_PASSWORD"])
