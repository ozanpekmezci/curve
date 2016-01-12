#= require action_cable
#= require_self
#= require channels/comments

@App = {}
App.cable = ActionCable.createConsumer()
# "wss://curve-app.com:28080"
