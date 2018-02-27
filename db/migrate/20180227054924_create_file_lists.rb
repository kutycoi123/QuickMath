class CreateFileLists < ActiveRecord::Migration[5.1]
  def change
    create_table :file_lists do |t|
      t.references :note, foreign_key: true

      t.timestamps
    end
  end
end
