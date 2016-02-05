$(document).ready ->
	$('#user_edit a').click (e) ->
  		e.preventDefault()
  		$(this).tab 'show'