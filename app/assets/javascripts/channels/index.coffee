#= require cable
#= require_self
#= require channels/comments

@App = {}
App.cable = ActionCable.createConsumer()
