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

		@non_user_notes = Note.all
		@user_notes = []
		if @user = current_user
			@user_notes = Note.where("user_id = ?", @user.id)
		end
		@non_user_notes -= @user_notes
	end
end
