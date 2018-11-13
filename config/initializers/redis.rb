config = Rails.application.config_for(:redis).symbolize_keys!

redis_db = Redis.new(host: config[:host], port: config[:port], db: config[:db])

# Access data to / from selected db
MsdApi::Redis = Redis::Namespace.new(redis: redis_db)
# Access data to / from selected db with namespace "#{namespace}"
MsdApi::RedisMsdApi = Redis::Namespace.new(config[:namespace], redis: redis_db)
# Access data to / from selected db with namespace "#{count_namespace}"
MsdApi::RedisCountAnalytics = Redis::Namespace.new(config[:count_namespace], redis: redis_db)
# Access data to / from selected db with namespace "#{color_namespace}"
MsdApi::RedisColorAnalytics = Redis::Namespace.new(config[:color_namespace], redis: redis_db)
# Access data to / from selected db with namespace "#{recent_namespace}"
MsdApi::RedisRecentAnalytics = Redis::Namespace.new(config[:recent_namespace], redis: redis_db)
