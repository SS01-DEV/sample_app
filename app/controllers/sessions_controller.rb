class SessionsController < ApplicationController

   def new
   	@title = "Sign in"
   end

	#-------------------------------------------------------------------------------------
	# Listing 9.8
	# NOTE use of Flash.now (as opposed to simply Flash)

	def create
		user = User.authenticate(params[:session][:email],
										 params[:session][:password])
		if user.nil?
			flash.now[:error] = "Invalid email/password combination."

			@title = "Sign in"
			render 'new'

		else
			# Sign the user in and redirect to the user's show page
			sign_in user

			#redirect_to user    replaced by next line (Listing 10.18)
			redirect_back_or user  # in sessions_helper

		end
	end
	#-------------------------------------------------------------------------------------



	#-------------------------------------------------------------------------------------
	# Listing 9.21
   def destroy
		sign_out  #in Sessions_helper.rb
		redirect_to root_path
   end
	#-------------------------------------------------------------------------------------
end
