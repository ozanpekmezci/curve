App.comments = App.cable.subscriptions.create "CommentsChannel",
  collection: -> $("[data-channel='comments']")

  connected: ->
    # FIXME: While we wait for cable subscriptions to always be finalized before sending posts
    setTimeout =>
      @followCurrentPost()
      @installPageChangeCallback()
    , 1000
    # connected sistem tarafindan otomatik cagiriliyo


  received: (data) ->
    unless @userIsCurrentUser(data.user_id)
      newSupply = $("[data-behavior='id-div-newSupply']")
      newSupplyAmount = $("[data-behavior='new-supply-amount']")
      existingSupplyAmount = parseInt(newSupplyAmount.text())
      newSupplyAmount.text(existingSupplyAmount+1)
      newSupply.show()
    #@collection().append data['comment'] unless @userIsCurrentUser(data.comment)
    # received sistem tarafindan otomatik cagiriliyo
    # alert data['comment']


  userIsCurrentUser: (user_id) ->
    user_id is $('meta[name=current-user]').attr('id')

  followCurrentPost: ->
    if postId = @collection().data('post-id')
      @perform 'follow', post_id: postId
    else
      @perform 'unfollow'

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'page:change', -> App.comments.followCurrentPost()

  speak: (comment) ->
    @perform 'speak', comment: comment
