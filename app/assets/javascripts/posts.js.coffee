jQuery ->
  $("[data-behavior='post_modal']").on 'show.bs.modal', (e) ->
    $("#select2-label-list").select2 tags: true

  $("#posts .media-list").infinitescroll
    navSelector: "nav.pagination" # selector for the paged navigation (it will be hidden)
    nextSelector: "nav.pagination a[rel=next]" # selector for the NEXT link (to page 2)
    itemSelector: "#posts div.post" # selector for all items you'll retrieve

  $("#query").autocomplete(
    source: "/posts/autocomplete",
    minLength: 2
  )
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
