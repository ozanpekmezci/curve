=begin
http://stackoverflow.com/questions/14842519/unicorn-rb-heroku-delayed-job-config
for delayed_job
=end
workers 1
preload_app!
# timeout 30

# setting the below code because of the preload_app true setting above:
# http://unicorn.bogomips.org/Unicorn/Configurator.html#preload_app-method

before_fork do |server, worker|
  #if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection_pool.disconnect!
    Rails.logger.info('Disconnected from ActiveRecord')
  # end
end

on_worker_boot do |server, worker|
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
    Rails.logger.info('Connected to ActiveRecord')
  end
end
