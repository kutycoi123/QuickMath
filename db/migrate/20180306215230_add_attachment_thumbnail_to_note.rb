class AddAttachmentThumbnailToNote < ActiveRecord::Migration[5.1]
  def self.up
    change_table :notes do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    drop_attached_file :notes, :thumbnail
  end
end
