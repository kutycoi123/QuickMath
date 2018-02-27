class FileItem < ApplicationRecord
  belongs_to :file_list
  has_attached_file :thumbnail,
  	:path=> ":rails_root/public/items/:id/:filename",
  	:url => "/iitems/:id/:filename"
  has_attached_file :item,
    :path => ":rails_root/public/items/:id/:filename",
    :url  => "/items/:id/:filename"

  do_not_validate_attachment_file_type :item, :thumbnail
end
