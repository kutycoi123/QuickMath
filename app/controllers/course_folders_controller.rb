class CourseFoldersController < ApplicationController
	def show
		
	end
	def new
		if !params[:user_id]
			if current_user
				redirect_to new_user_course_path(current_user)
			else
				flash[:danger] = "Please login to add courses"
				redirect_to login_path
			end
		end
	end
	def create
		@course = Course.find_by(name: params[:course_folder][:name])
		@user = User.find(params[:user_id])
		if correct_user?(@user)
			if @course
				if !@user.course_folders.any? {|x| x.name == @course.name}
					@course_folder = CourseFolder.create(name: @course.name)
					@user.course_folders << @course_folder
					if @user.save
						flash[:success] = "Add course successfully"
						redirect_to user_path(@user)
					else
						flash.now[:danger] = "Fail to add course"
						render 'new'
					end
				else
					flash.now[:danger] = "Course is already in your list"
					render 'new'
				end
			else
				flash.now[:danger] = "Course not found"
				render 'new'
			end
		else
			flash[:danger] = "You are not allowed to see/change this information"
			redirect_to user_path(@user)
		end

	end
end
