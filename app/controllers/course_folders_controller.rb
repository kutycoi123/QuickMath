class CourseFoldersController < ApplicationController
	def show
		@course_folder = CourseFolder.find(params[:id])
		
		# allNotes = @course.notes.to_a
		# @user_notes = []
		# if @user = current_user
		# 	allNotes.select! {|note| @user_notes << note if note.user_id == @user.id
		# 						note.user_id != @user.id}
		# end
		# @non_user_notes = allNotes
		@non_user_notes = []
		@user_notes = []
		# CourseFolder.find(name: @course_folder.name) { |f| @non_user_notes += f.notes }
		CourseFolder.all.each do |f|
			@non_user_notes += f.notes if f.name == @course_folder.name
		end
		
		@user = current_user
		if @user 
			if params[:user_id] && @user != User.find(params[:user_id])
				#flash[:danger] = "User not found"
				redirect_to root_path
			end
			if correct_user?(@user)
				@non_user_notes.select {|f| @user_notes << f if f.user_id == @user.id}
				@non_user_notes -= @user_notes
			else
				#flash[:danger] = "You are not allowed to see other people's information"
				redirect_to user_path(@user)
			end
		
		end
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
