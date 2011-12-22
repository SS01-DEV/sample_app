
# Listing 9.12
module SessionsHelper  # included in application controller



	def sign_in(user)
		cookies.permanent.signed[:remember_token] = [user.id, user.salt]
		current_user = user
	end



	# Listing 9.16  Finding the current user by remember_token;  see Box 9.4 section 9.3.3
	def current_user
		@current_user ||= user_from_remember_token  # set @current_user only if not defined
	end


	# Listing 9.18 
	def signed_in?
		!current_user.nil?
	end


	# Listing 9.22 
	def sign_out
		cookies.delete(:remember_token)
		current_user = nil
	end


		#-------------------------------------------------------------------------------------
		#NOTE: Listing 10.12 -- used in users_controller to limit access
		#
		#  the next statement is equivalent to: flash[:notice] = "Please sign in to access this page."
		#                                       redirect_to signin_path                                     
		def deny_access
			store_location   # lISTING 10.17
			redirect_to signin_path, :notice => "Please sign in to access this page."
		end
		#-------------------------------------------------------------------------------------


		#-------------------------------------------------------------------------------------
		# Listing 10.17
		def redirect_back_or(default)
			redirect_to(session[:return_to] || default)
			clear_return_to
		end
		#-------------------------------------------------------------------------------------



	private


		#-------------------------------------------------------------------------------------
		#NOTE See Listing 9.16 and following explanations for odd usage below . . .
		def user_from_remember_token

			#  "*" allows use of a 2-element array as an argument to a method expecting two variables
			User.authenticate_with_salt(*remember_token)
 		end
		#-------------------------------------------------------------------------------------
 

		#-------------------------------------------------------------------------------------
		#NOTE: cookies.signed[:remember_token]  returns an ARRAY of 2 values
		def remember_token
			cookies.signed[:remember_token] || [nil, nil]
		end
		#-------------------------------------------------------------------------------------


		#-------------------------------------------------------------------------------------
		#NOTE: Listing 10.14 -- used in users_controller to limit access
		def current_user?(user)
			user == current_user
		end
		#-------------------------------------------------------------------------------------


		#-------------------------------------------------------------------------------------
		# Listing 10.17
		def store_location
			session[:return_to] = request.fullpath
		end
		#-------------------------------------------------------------------------------------


		#-------------------------------------------------------------------------------------
		# Listing 10.17
		def clear_return_to
			session[:return_to] = nil
		end
		#-------------------------------------------------------------------------------------


end







