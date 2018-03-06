class AddCourseFolderIdToNotes < ActiveRecord::Migration[5.1]
  def change
  	add_column :notes, :course_folder_id, :integer
  end
end
