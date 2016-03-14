class Notifications
  constructor: ->
    @notifications = $("[data-behavior='notifications']")
    @setup() if @notifications.length > 0

  setup: ->
    alert "setup"
    console.log(@notifications)

jQuery ->
  alert "new notif"
  new Notifications
