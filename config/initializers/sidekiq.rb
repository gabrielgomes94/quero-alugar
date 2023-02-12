# frozen_string_literal: true


Sidekiq.configure_server do |config|
  config.redis = { host: ENV['REDIS_HOST'] }
  config.logger = Logger.new("log/sidekiq.log")
end

Sidekiq.configure_client do |config|
  config.redis = { host: ENV['REDIS_HOST'] }
end
