class Registration
	constructor: ->
  	@item = $('.nav-tabs a')
	  @setEvents()

	setEvents: ->
		@item.click (e) ->
  		e.preventDefault()
  		$(this).tab 'show'

jQuery ->
	new Registration
