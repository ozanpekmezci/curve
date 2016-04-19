jQuery ->
  new Autocomplete

  $("[data-behavior='post_modal']").on 'show.bs.modal', (e) ->
    $("#select2-label-list").select2 tags: true

  $("#posts .media-list").infinitescroll
    navSelector: "nav.pagination" # selector for the paged navigation (it will be hidden)
    nextSelector: "nav.pagination a[rel=next]" # selector for the NEXT link (to page 2)
    itemSelector: "#posts div.post" # selector for all items you'll retrieve

  if navigator.geolocation
    navigator.geolocation.getCurrentPosition showPosition
  else
    alert 'Geolocation is not supported by this browser.'
  return

showPosition = (position) ->
  alert 'Latitude: ' + position.coords.latitude + '<br>Longitude: ' + position.coords.longitude
  return



class Autocomplete
  constructor: ->
    numbers = new Bloodhound(
      remote:
        url: '/posts/autocomplete?query=%QUERY'
        wildcard: '%QUERY'
      datumTokenizer: (d) ->
        Bloodhound.tokenizers.whitespace d.title
      queryTokenizer: Bloodhound.tokenizers.whitespace)
    # initialize the bloodhound suggestion engine
    promise = numbers.initialize()
    promise.done(->
      console.log 'success!'
      return
    ).fail ->
      console.log 'err!'
      return
    # instantiate the typeahead UI
    $('.typeahead').typeahead null,
      name: 'search'
      display: 'title'
      source: numbers
      templates:
        empty: [
          '<div class="empty-message ">'
          'Unable to find any Products that match the current query'
          '</div>'
        ].join('\n')
        header: "<div><h3 class='posts-title'>Posts</h3></div>"

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
