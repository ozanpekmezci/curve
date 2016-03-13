##
#from actioncable-examples
require ::File.expand_path('../../config/environment',  __FILE__)
Rails.application.eager_load!

#require 'action_cable/process/logging'
#ActionCable.server.config.allowed_request_origins = ["https://curve-app.com:443", "https://curve-app.com"]
ActionCable.server.config.disable_request_forgery_protection = true
#ActionCable.server.config.allowed_request_origins = ['http://curve-app.com','http://www.curve-app.com','https://curve-app.com','https://www.curve-app.com', /http:\/\/curve.*/]
run ActionCable.server
