module ApplicationHelper
	##
	# to put the header in application.html.erb
	def header(text)
  		content_for(:header) { text.to_s }
	end
end
