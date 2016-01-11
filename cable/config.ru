##
#from actioncable-examples
require ::File.expand_path('../../config/environment',  __FILE__)
Rails.application.eager_load!

require 'action_cable/process/logging'
ActionCable.server.config.allowed_request_origins = ["https://localhost:8080","https://localhost:3000","https://localhost:3000","https://curve-app.com:3000","http://curve-app.com:3000","http://curve-app.com:80"]
run ActionCable.server
