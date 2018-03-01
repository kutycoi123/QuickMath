class CoursesController < ApplicationController
	def show
		@course = Course.find(params[:id])
		
		# allNotes = @course.notes.to_a
		# @user_notes = []
		# if @user = current_user
		# 	allNotes.select! {|note| @user_notes << note if note.user_id == @user.id
		# 						note.user_id != @user.id}
		# end
		# @non_user_notes = allNotes

		@non_user_notes = @course.notes
		@user_notes = []
		@user = current_user
		if @user
			if params[:user_id] && @user != User.find(params[:user_id])
				#flash[:danger] = "User not found"
				redirect_to root_path
			end
			if correct_user?(@user)
				@user_notes = @non_user_notes.where("user_id = ?", @user.id)
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
		@course = Course.find_by(name: params[:course][:name])
		@user = User.find(params[:user_id])
		if correct_user?(@user)
			if @course
				if !@user.courses.include?(@course)
					@user.courses << @course
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
