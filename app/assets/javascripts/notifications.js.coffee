class Notifications
  constructor: ->
    @notifications = $("[data-behavior='notifications']")
    if @notifications.length > 0
      @handleSuccess @notifications.data("notifications")
    $("[data-behavior='notifications']").on "click", @getNewNotifications
  #    @createNotificationInterval()
    #NOTE: settimeout kullanildiginda istedigin seyi erteleyebiliyosun
#  createNotificationInterval: ->
#    @interval = setInterval (=>
#      @getNewNotifications()
#    ), 5000

  getNewNotifications:(e) =>
    $.ajax(
      url: "/notifications.json"
      dataType: "JSON"
      method: "GET"
      success: @handleSuccess
    )

  handleSuccess: (data) =>
    items = $.map data, (notification) ->
      "<a class='dropdown-item' data-id='#{notification.id}' data-behavior='notification-item' href='#{notification.url}'>#{notification.actor} #{notification.action} #{notification.notifiable.type} </a>"
    $("[data-behavior='unread-count']").text(items.length)
    $("[data-behavior='notification-items']").html(items)
    items = $.map $("[data-behavior='notification-items']").find("[data-behavior='notification-item']"), (item) ->
      new Notification(item)

class Notification
  constructor: (item) ->
    @item = $(item)
    @id   = @item.data("id")
    @setEvents()

  setEvents: ->
    @item.on "click", @handleClick

  handleClick: =>
    $.ajax(
      url: "/notifications/#{@id}/mark_as_read"
      dataType: "JSON"
      method: "POST"
      success: ->
         #$("[data-behavior='unread-count']").text(0)
    )
jQuery ->
  new Notifications
