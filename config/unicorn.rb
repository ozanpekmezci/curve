=begin
http://stackoverflow.com/questions/14842519/unicorn-rb-heroku-delayed-job-config
for delayed_job
=end
worker_processes 3
preload_app true
timeout 30

# setting the below code because of the preload_app true setting above:
# http://unicorn.bogomips.org/Unicorn/Configurator.html#preload_app-method

before_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
    Rails.logger.info('Disconnected from ActiveRecord')
  end
end

after_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
    Rails.logger.info('Connected to ActiveRecord')
  end
end