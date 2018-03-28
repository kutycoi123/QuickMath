class SessionsController < ApplicationController
	def new
	end
	def create
	    @user = User.find_by(email: params[:session][:email])
	    if @user && @user.authenticate(params[:session][:password])
	    	if @user.activated?
	    		log_in @user
	    		#if remember box is checked (==1), remember(user), otherwise forget(user)
	    		params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
	    		flash.now[:success] = "Successfully logged in"
	    		setLoginErrorsDetected(false)
	    		redirect_back_or user_path(@user)
	    	else
	    		message  = "Account not activated. "
	    		message += "Check your email for the activation link."
	    		flash[:warning] = message
	    		redirect_to welcome_path
	    	end
	    else
	    	setLoginErrorsDetected(true)
			setLoginErrors(["Invalid email or password"])
			redirect_to welcome_path
	    end
	end
	def destroy
		log_out if logged_in?
		setSignUpErrorsDetected(false)
		setLoginErrorsDetected(false)
		redirect_to welcome_path
	end
end
