#= require action_cable
#= require_self
#= require_tree ./channels
# require channels/comments

@App ||= {}
App.cable = ActionCable.createConsumer("ws://curve-app.com:28080/cable")
