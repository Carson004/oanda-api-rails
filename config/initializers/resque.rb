require 'resque'
require 'resque-scheduler'
require 'resque/scheduler/server'

Resque.redis = 'localhost:6379'
Resque.redis.namespace = "resque:oanda_api_rails:#{Rails.env}"
Resque.logger = Logger.new('log/resque.log', 5, 10.megabytes)
Resque.logger.level = Logger::INFO
Resque::Scheduler.dynamic = true
Resque::Scheduler.configure do |c|
  c.logfile = Rails.root.join('log', 'resque-scheduler.log')
end
