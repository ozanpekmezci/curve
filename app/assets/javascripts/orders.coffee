jQuery ->
  window.chat =
    checkInputKey: (event, chatboxtextarea, chat_id) ->
      #alert "checkInputKey"
      if event.keyCode == 13
        event.preventDefault()
        if event.shiftKey == true
          fire = chatboxtextarea.val()
          $(chatboxtextarea).val fire + '\n'
        else
        #alert "enter'a basildi"
          fire = chatboxtextarea.val()
          fire = fire.replace(/^\s+|\s+$/g, '')
          if fire != ''
            $('#chat_form_' + chat_id).submit()
            $(chatboxtextarea).val ''
            $(chatboxtextarea).focus()
            $(chatboxtextarea).css 'height', '44px'
      adjustedHeight = chatboxtextarea.clientHeight
      maxHeight = 94
      if maxHeight > adjustedHeight
        adjustedHeight = Math.max(chatboxtextarea.scrollHeight, adjustedHeight)
        if maxHeight
          adjustedHeight = Math.min(maxHeight, adjustedHeight)
        if adjustedHeight > chatboxtextarea.clientHeight
          $(chatboxtextarea).css 'height', adjustedHeight + 8 + 'px'
      else
        $(chatboxtextarea).css 'overflow', 'auto'
      return
