class AddUserIdToCourseFolder < ActiveRecord::Migration[5.1]
  def change
    add_column :course_folders, :user_id, :integer
  end
end
