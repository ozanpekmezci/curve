class Notifications
  constructor: ->
    @notifications = $("[data-behavior='notifications']")
    if @notifications.length > 0
      @handleSuccess @notifications.data("notifications")
      $("[data-behavior='notifications']").on "click", @handleClick
      @interval = setInterval (=>
        @getNewNotifications()
      ), 5000
    #NOTE: settimeout kullanildiginda istedigin seyi erteleyebiliyosun

  interruptNotificationInterval: ->
    clearInterval(@interval) if @interval
  # if modal is not shown/visible then do something


  getNewNotifications: ->
    $.ajax(
      url: "/notifications.json"
      dataType: "JSON"
      method: "GET"
      success: @handleSuccess
    )
  handleClick:(e) =>
    $.ajax(
      url: "/notifications/mark_as_read"
      dataType: "JSON"
      method: "POST"
      success: ->
        $("[data-behavior='unread-count']").text(0)
    )
  handleSuccess: (data) =>
    items = $.map data, (notification) ->
      "<a class='dropdown-item' href='#{notification.url}'>#{notification.actor} #{notification.action} #{notification.notifiable.type} </a>"
    $("[data-behavior='unread-count']").text(items.length)
    $("[data-behavior='notification-items']").html(items)


jQuery ->
  new Notifications

$(document).ajaxComplete ->
  if $("[data-behavior='post_modal']").is(':visible')
    @interruptNotificationInterval()
