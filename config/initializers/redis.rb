config = Rails.application.config_for(:redis).symbolize_keys!

MsdApi::Redis = Redis::Namespace.new(config['namespace'],
 :redis => Redis.new(host: config['host'],
  port: config['port'], db: config['db']))