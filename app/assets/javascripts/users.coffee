jQuery ->
  ###*
  # Listen on keypress' in our chat textarea and call the
  # chatInputKey in chat.js for inspection
  ###

  $(document).on 'keydown', '.chatboxtextarea', (event) ->
    id = $(this).data('cid')
    window.chat.checkInputKey event, $(this), id
    return
