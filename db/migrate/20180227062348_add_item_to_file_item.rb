class AddItemToFileItem < ActiveRecord::Migration[5.1]
  def self.up
    change_table :file_items do |t|
      t.attachment :item
    end
  end

  def self.down
    drop_attached_file :file_items, :item
  end
end
