class CreateCourseFolders < ActiveRecord::Migration[5.1]
  def change
    create_table :course_folders do |t|
      t.string :name
      t.string :title
      t.integer :year
      t.string :term

      t.timestamps
    end
  end
end
