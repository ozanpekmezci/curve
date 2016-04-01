postArray = []
jQuery ->
  #if postArray.length > 0
  newDemands = document.getElementById('id-div-newDemand')
  newDemands.style.cursor = 'pointer'
  newDemands.onclick = ->
     @handleClick
  $("[data-behavior='newDemandButton']").on "click", @handleClick

  handleClick:(e) =>
    divNd = $('.div-newDemand')
    divNd.hide()
    nd = $('.newDemand')
    nd.text("0")
    index = 0
    while index < postArray.length
      $("[data-channel='posts']").prepend postArray[index]
      index++

App.posts = App.cable.subscriptions.create "PostsChannel",
  collection: -> $("[data-channel='posts']")

  connected: ->
    # FIXME: While we wait for cable subscriptions to always be finalized before sending posts
    setTimeout =>
      @followStream()
      @installPageChangeCallback()
    , 1000
    # connected sistem tarafindan otomatik cagiriliyo


  received: (data) ->
     # redundant: FIXME
     nd = $('.newDemand')
     divNd = $('.div-newDemand')
     postArray.push data['post']
     if @userIsCurrentUser(data.post)
       index = 0
       while index < postArray.length
         $("[data-channel='posts']").prepend postArray[index]
         index++
       postArray = []
       divNd.hide()
       nd.text("0")
       #postdiv = $('#new-post-form')
       #postdiv.hide()
    # @collection().prepend data['post'] if @userIsCurrentUser(data.post)
     else
    # alert data['post']
      nbr = parseInt(nd.text())
      nd.text(nbr+1)
     #$('.newDemand').html parseInt($('.newDemand').html(), 10)+1
      divNd.show()
     #unless @userIsCurrentUser(data.post)
    # received sistem tarafindan otomatik cagiriliyo
    # alert data['comment']

  userIsCurrentUser: (post) ->
    $(post).attr('data-user-id') is $('meta[name=current-user]').attr('id')

  followStream: ->
    if @collection().data('stream-id') == "posts_stream"
      @perform 'follow', current_user_id: $('meta[name=current-user]').attr('id')
    else
      @perform 'unfollow'

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'page:change', -> App.posts.followStream()
