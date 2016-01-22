postArray = []
window.onload = ->
  something = document.getElementById('id-div-newDemand')
  something.style.cursor = 'pointer'

  something.onclick = ->
    divNd = $('.div-newDemand')
    divNd.hide()
    nd = $('.newDemand')
    nd.text("0")
    $("[data-channel='posts']").prepend postArray


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
     postArray.push data['post']
    #  @collection().prepend data['post']
     nd = $('.newDemand')
     nbr = parseInt(nd.text())
     nd.text(nbr+1)
     #$('.newDemand').html parseInt($('.newDemand').html(), 10)+1
     divNd = $('.div-newDemand')
     divNd.show()
     #unless @userIsCurrentUser(data.post)
    # received sistem tarafindan otomatik cagiriliyo
    # alert data['comment']


  userIsCurrentUser: (post) ->
    $(post).attr('data-user-id') is $('meta[name=current-user]').attr('id')

  followStream: ->
    if @collection().data('stream-id') == "posts_stream"
      @perform 'follow'
    else
      @perform 'unfollow'

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'page:change', -> App.posts.followStream()
