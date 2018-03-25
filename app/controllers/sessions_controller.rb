class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(email: params[:session][:email])
		if @user && @user.authenticate(params[:session][:password])
			log_in @user
			flash.now[:success] = "Successfully logged in"
			setLoginErrorsDetected(false)
			redirect_to user_path(@user)
		else
			setLoginErrorsDetected(true)
			setLoginErrors(["Invalid email or password"])
			redirect_to welcome_path
		end
	end
	def destroy
		if logged_in?
			log_out
		end
		setSignUpErrorsDetected(false)
		setLoginErrorsDetected(false)
		redirect_to welcome_path
	end
end
