class UsersController < ApplicationController
	def new
		
	end
	def create
		
	end
	def show
		# @user = User.find(params[:id])
		# redirect_to edit_user_path(@user)
		render 'edit'
	end
	def edit
		correct_user
	end
	def update
		# @user = User.find(params[:id])
		@user = current_user
		if @user && @user.update_attributes(user_params)
			flash.now[:success] = "Update successfully"
			redirect_to root_path
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
