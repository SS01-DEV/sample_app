class UsersController < ApplicationController

	# Listing 10.11 - added security
	#      NOTE: the filter is defined in the "private" section
	#            of this controller; it is applied BEFORE any other actions.
	before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
	before_filter :correct_user, :only => [:edit, :update]   #Listing 10.14
	before_filter :admin_user, :only => :destroy   #Listing 10.41



	#===============================================================
	# Listing 10.41 Rails 3 tutorial

	def destroy 
		@title = "DESTROY" 
		$msg = "DESTROY" 

		User.find(params[:id]).destroy
		flash[:notice] = "def DESTORY in Users.controller"
		flash[:success] = "User destroyed!"

		redirect_to users_path

	end
	#===============================================================







	#===============================================================
	# Listing 10.20 Rails 3 tutorial

	def index
		@title = "All users"

		# @users = User.all  replaced with "will_paginate"  see Listing 10.28
		# @users = User.all
 


		# @users = User.paginate(:per_page => 10, :page => params[:page])

		@users = User.order("admin DESC").paginate(:per_page => 10, :page => params[:page])


	end 
 
	#===============================================================



	#===============================================================
	# Listing 6.25 Rails 3 tutorial
	def show

		@user = User.find(params[:id])
			#  @user = User.first # TEST - temporary - QQQR


 		# listing 7.19
		@title = @user.name 
          
	end
	#===============================================================


	#===============================================================
   def new
					# OLD TEST  @user = User.first # TEST - temporary - QQQR

		 @user = User.new      #Rails 3 tutorial section 8.1
		 @title = "Sign up"
   end
	#===============================================================


	#===============================================================
	# See section 8.2.2 of Rails 3 Tutorial
   def create

      @user = User.new(params[:user])

      if @user.save
      	# Handle a successful save; see Listing 8.15

			sign_in @user  #Listing 9.24
		   flash[:success] = "Welcome to the Sample App!"  # see Listing 8.18
			redirect_to @user

      else
      	@title = "Sign up"
      	render 'new'   # render the "_new" partial

      end
   end
	#===============================================================


	#===============================================================
	# See Listing 10.2 of Rails 3 Tutorial
	def edit

		# Setting @user no longer needed: see Listing 10.14 & cet: 
		#     correct_user "before" filter and "current_user?"
		#     method now sets "@user"
		#   @user = User.find(params[:id]) #--- no longer needed 

		@title = "Edit user"
	end
	#===============================================================



	#===============================================================
	# See Listing 10.9 of Rails 3 Tutorial
	def update

		# Setting @user no longer needed: see Listing 10.14 & cet: 
		#     correct_user "before" filter and "current_user?"
		#     method now sets "@user"
		#   @user = User.find(params[:id]) #--- no longer needed

		if @user.update_attributes(params[:user])
			flash[:success] = "Profile updated."
			redirect_to @user
		else
			@title = "Edit user"
			render 'edit'
		end
	end
	#===============================================================


	private

		def authenticate
			deny_access unless signed_in?
		end

		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_path) unless current_user?(@user)
		end


		#Listing 10.41
		def admin_user
			redirect_to(root_path) unless current_user.admin?
		end

end   #end class UsersController












