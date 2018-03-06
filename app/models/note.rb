class Note < ApplicationRecord
	belongs_to :course_folder
	belongs_to :user
end
