class AuthsController < ApplicationController

	# Show a login form
	def new
		if current_user
			redirect_to covers_path
		else
			# Make a login form from an object that has username and password
			@user = User.new
		end
	end

	# Log them in!
	def create
		# if params[:user][:username].present?
			user = User.find_by(username: params[:user][:username])
			
			if user && user.authenticated?(params[:user][:password])
				session[:user_id] = user.id
				redirect_to covers_path

			else
				redirect_to new_auth_path
				flash[:notice] = "username and/or password is invalid"
			end
		# else
			# redirect_to new_auth_path
			# flash[:notice] = "username and/or password is invalid"
		# end
	end

	# Log out
	def destroy
		session[:user_id] = nil
		redirect_to new_auth_path
	end

end