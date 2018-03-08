class NotesController < ApplicationController
	def destroy
		@note = Note.find(params[:id])
		@course_folder = @note.course_folder
		@note.destroy
		redirect_to course_folder_path(@course_folder)
	end
	private
		def note_params
			params.require(:note).permit(:description, :course_folder_id, :item, :thumbnail)
		end
end