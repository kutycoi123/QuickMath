class CoursesController < ApplicationController
	def show
		@course = Course.find(params[:id])
		@non_user_folders = []
		@user_folders = []
		CourseFolder.all.each do |f|
			@non_user_folders << f if f.name == @course.name
		end
		
		@user = current_user
		if @user 
			if params[:user_id] && @user != User.find(params[:user_id])
				#flash[:danger] = "User not found"
				redirect_to root_path
			end
			if correct_user?(@user)
				@non_user_folders.select {|f| @user_folders << f if f.user_id == @user.id}
				@non_user_folders -= @user_folders
			else
				#flash[:danger] = "You are not allowed to see other people's information"
				redirect_to user_path(@user)
			end
		
		end
	end
end
