$(document).ready ->
	$('.nav-tabs a').click (e) ->
  		e.preventDefault()
  		$(this).tab 'show'