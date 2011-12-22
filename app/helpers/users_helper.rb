module UsersHelper


	#=======================================================================================
	# From Rails 3 Tutorial section 7.3.2
	#  The first argument in the call to gravatar_image_tag passes in the lower-case version
	#  of the user’s email address (using the downcase method).22 Then the first option to
	#  gravatar_image_tag assigns the user’s name to the img tag’s alt attribute (which
	#  gets displayed in devices that can’t render images), while the second option sets the CSS
	#  class of the resulting Gravatar. The third option passes the options hash using the
	#  :gravatar key, which (according to the gravatar_image_tag gem documentation)
	#  is how to set the options for gravatar_image_tag. Note that the function definition
	#  sets a default option for the size of the Gravatar (NOTE: Gravatars are square), using
	#  	option = { :size => 50 }
	#  This sets the default Gravatar size to 50x50, while also allowing us to override the default
	#  size using code like
	#  	<%= gravatar_for @user, :size => 30 %>
	#  ---------------------------------------------------------

   def gravatar_for(user, options = { :size => 50 })
   	gravatar_image_tag(user.email.downcase, 	:alt => user.name,
   															:class => 'gravatar',     																										:gravatar => options)
   end
	#=======================================================================================



end
