App.fires = App.cable.subscriptions.create "FiresChannel",
  collection: -> $("[data-channel='fires']")

  connected: ->
    # FIXME: While we wait for cable subscriptions to always be finalized before sending posts
    setTimeout =>
      @followCurrentChat()
      @installPageChangeCallback()
    , 1000
    # connected sistem tarafindan otomatik cagiriliyo


  received: (data) ->
    @collection().append data['fire'] unless @userIsCurrentUser(data.fire)
    # received sistem tarafindan otomatik cagiriliyo
    # alert data['comment']


  userIsCurrentUser: (fire) ->
    $(fire).attr('data-user-id') is $('meta[name=current-user]').attr('id')

  followCurrentChat: ->
    if chatId = @collection().data('channel-id')
      @perform 'follow', chat_id: chatId
    else
      @perform 'unfollow'

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'page:change', -> App.fires.followCurrentPost()
