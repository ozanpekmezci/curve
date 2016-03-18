class Registration
	constructor: ->
		@setEvents()

	setEvents: ->
		@item = $('.nav-tabs a')
		@item.on "click", (event) ->
			event.preventDefault()
  		$(this).tab 'show'

jQuery ->
	new Registration
