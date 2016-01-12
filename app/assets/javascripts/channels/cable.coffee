#= require action_cable
#= require_self
#= require channels/comments
# require_tree ./channels

@App ||= {}
App.cable = ActionCable.createConsumer()
# "wss://curve-app.com:28080"