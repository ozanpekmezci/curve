#= require action_cable
#= require_self
#= require_tree ./channels
# require channels/comments

@App ||= {}
App.cable = ActionCable.createConsumer("ws://46.101.201.98:28080/cable")
