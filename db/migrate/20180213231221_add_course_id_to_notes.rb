class AddCourseIdToNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :course_id, :integer
  end
end
