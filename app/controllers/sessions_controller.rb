class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(email: params[:session][:email])
		if @user && @user.authenticate(params[:session][:password])
			log_in @user
			flash.now[:success] = "Successfully login"
			redirect_to root_path
		else
			flash.now[:danger] = "Invalid email or password"
			render 'new'
		end
	end
	def destroy
		if logged_in?
			log_out
		end
		redirect_to welcome_path
	end
end
