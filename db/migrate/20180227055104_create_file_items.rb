class CreateFileItems < ActiveRecord::Migration[5.1]
  def change
    create_table :file_items do |t|
      t.references :file_list, foreign_key: true

      t.timestamps
    end
  end
end
