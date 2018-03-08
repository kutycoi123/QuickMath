class Note < ApplicationRecord
	belongs_to :course_folder
	has_attached_file :thumbnail,
  	:path=> ":rails_root/public/items/:id/:filename",
  	:url => "/items/:id/:filename"
  	has_attached_file :item,
    :path => ":rails_root/public/items/:id/:filename",
    :url  => "/items/:id/:filename"
  	do_not_validate_attachment_file_type :item, :thumbnail
end
