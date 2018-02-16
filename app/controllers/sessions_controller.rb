class SessionsController < ApplicationController
	def new
<<<<<<< HEAD
		
	end
=======
	end

>>>>>>> 721266809624b699f5477df52229865e1f0e8966
	def create
		@user = User.find_by(email: params[:session][:email])
		if @user && @user.my_authenticate(params[:session][:password])
			log_in @user
			flash[:success] = "Successfully login"
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
<<<<<<< HEAD
		redirect_to home_path
=======
		redirect_to welcome_path
>>>>>>> 721266809624b699f5477df52229865e1f0e8966
	end
end
