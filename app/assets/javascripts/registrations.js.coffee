class Registration
	constructor: ->
		@item = $('.nav-tabs a')
		@setEvents()

	setEvents: ->
		@item.on "click", (event) ->
			event.preventDefault()
  		$(this).tab 'show'

jQuery ->
	new Registration
