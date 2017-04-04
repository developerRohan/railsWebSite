class AuthenticationController < ApplicationController


	def new

	end

	def login
		user = User.find_by(email: params[:session][:email])
		#debugger
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:success] = "successfully logged in"
			redirect_to user_path(user)
		else
			flash[:danger] = "there was something wrong with your login details"
			redirect_to login_path
		end
	end

	def logout
		session[:user_id] = nil
		flash[:success] = "successfully logged out"
		redirect_to root_path
	end
end

