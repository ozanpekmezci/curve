App.notifications = App.cable.subscriptions.create "NotificationsChannel",
  collection: -> $("[data-behavior='notifications']")

  connected: ->
    # FIXME: While we wait for cable subscriptions to always be finalized before sending posts
    setTimeout =>
      @followNotifications()
      @installPageChangeCallback()
    , 1000
    # connected sistem tarafindan otomatik cagiriliyo


  received: (data) ->
    #unless @userIsCurrentUser(data.user_id)
    newNotifAmount = $("[data-behavior='unread-count']")
    existingNotifAmount = parseInt(newNotifAmount.text())
    newNotifAmount.text(existingNotifAmount+1)
     #@collection().append data['comment'] unless @userIsCurrentUser(data.comment)
    # received sistem tarafindan otomatik cagiriliyo
    # alert data['comment']


  userIsCurrentUser: (user_id) ->
    user_id is $('meta[name=current-user]').attr('id')

  followNotifications: ->
    if  "notifications_stream" == @collection().data('stream-id')
      @perform 'follow', current_user_id: $('meta[name=current-user]').attr('id')
    else
      @perform 'unfollow'

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'page:change', -> App.notifications.followNotifications()
