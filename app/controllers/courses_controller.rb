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
				redirect_to welcome_path
			end
			if correct_user?(@user)
				@non_user_folders.select {|f| @user_folders << f if f.user_id == @user.id}
				@non_user_folders -= @user_folders
			else
				#flash[:danger] = "You are not allowed to see other people's information"
				redirect_to user_path(@user)
			end
		end
		if params[:sort_by] && params[:sort_by] == "upvotes"
			 @user_folders = @user_folders.sort_by {|f| f.get_upvotes.size}
			 @non_user_folders = @non_user_folders.sort_by {|f| f.get_upvotes.size}
			 @user_folders.reverse!
			 @non_user_folders.reverse!
		elsif params[:sort_by] && params[:sort_by] == "downvotes"
			@user_folders = @user_folders.sort_by {|f| f.get_downvotes.size}
			@non_user_folders = @non_user_folders.sort_by {|f| f.get_downvotes.size}
			@user_folders.reverse!
			@non_user_folders.reverse!

		end
	end
	def search
		if params[:course][:name].empty?
			flash[:danger] = "Please enter the course codes"
			redirect_to welcome_path and return
		end
		@course = Course.find_by(name: params[:course][:name])
		if @course
			redirect_to course_path(@course)
		else
			flash[:danger] = "Course not found."
		end
	end

	private
	def course_params
		params.require(:course).permit(:name)
	end



end
