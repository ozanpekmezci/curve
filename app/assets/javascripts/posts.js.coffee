jQuery ->
  $("[data-behavior='post_modal']").on 'show.bs.modal', (e) ->
    $("#select2-label-list").select2 tags: true

  $("#posts .media-list").infinitescroll
    navSelector: "nav.pagination" # selector for the paged navigation (it will be hidden)
    nextSelector: "nav.pagination a[rel=next]" # selector for the NEXT link (to page 2)
    itemSelector: "#posts div.post" # selector for all items you'll retrieve

ready = undefined

ready = ->
  numbers = new Bloodhound(
    remote: url: '/posts/autocomplete?query=%QUERY'
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
    displayKey: 'title'
    source: numbers.ttAdapter()
  return

$(document).ready ready
$(document).on 'page:load', ready
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
