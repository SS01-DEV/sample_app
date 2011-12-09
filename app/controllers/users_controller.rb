class UsersController < ApplicationController

	# Listing 6.25 Rails 3 tutorial
	def show
		@user = User.find(params[:id])

 		#listing 7.19
		@title = @user.name           
	end


  def new
		@title = "Sign up"
  end

end
