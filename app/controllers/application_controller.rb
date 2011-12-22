class ApplicationController < ActionController::Base

   protect_from_forgery


	# section 9.3.2
	include SessionsHelper

	$msg = "NONE" 

end
