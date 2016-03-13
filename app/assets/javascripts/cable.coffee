#= require action_cable
#= require_self
#= require_tree ./channels
# require channels/comments

@App ||= {}
App.cable = ActionCable.createConsumer("/cable")
