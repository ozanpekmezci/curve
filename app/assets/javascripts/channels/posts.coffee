postArray = []
newDemandButton = document.getElementById('newDemandButton')
newDemandButton.onclick = ->
  file_field_picture = document.getElementById('multiple_upload_butt')
  file_field_picture.onclick = ->
    alert("anan")
window.onload = ->
  # if $('.id-div-newDemand').length
  something = document.getElementById('id-div-newDemand')
  something.style.cursor = 'pointer'
  something.onclick = ->
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
       divNd.hide()
       nd.text("0")
       postdiv = $('.new-post-form')
       postdiv.hide()
    # @collection().prepend data['post'] if @userIsCurrentUser(data.post)
     else
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
      @perform 'follow'
    else
      @perform 'unfollow'

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'page:change', -> App.posts.followStream()
