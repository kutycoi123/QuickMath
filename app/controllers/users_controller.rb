class UsersController < ApplicationController
	before_action :correct_user, only: [:edit, :show, :update]
	def new
		@user=User.new
	end
	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Sign up successful. Try logging in the system"
			redirect_to login_path
		else
			flash[:danger] = "Please try to sign up again"
			redirect_to welcome_path
		end
	end
	def show
		 @user = User.find(params[:id])
	end
	def edit

	end
	def update
		# @user = User.find(params[:id])
		@user = current_user
		if @user && @user.update_attributes(user_params)
			flash.now[:success] = "Update successfully"
			redirect_to @user
		else
			render 'edit'
		end
	end
	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
		def correct_user
	      @user = User.find(params[:id])
		 	if !correct_user?(@user)
		        flash.now[:danger] = "You are not allowed to change this sort of information"
		        redirect_to root_path
	      	end
    	end
end
