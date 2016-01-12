##
#from actioncable-examples
require ::File.expand_path('../../config/environment',  __FILE__)
Rails.application.eager_load!

require 'action_cable/process/logging'
ActionCable.server.config.allowed_request_origins = [ "https://curve-app.com:3000","https://curve-app.com:8080","https://curve-app.com:80","https://curve-app.com"]
run ActionCable.server
