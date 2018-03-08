class AddAttachmentItemToNote < ActiveRecord::Migration[5.1]
  def self.up
    change_table :notes do |t|
      t.attachment :item
    end
  end

  def self.down
    drop_attached_file :notes, :item
  end
end
