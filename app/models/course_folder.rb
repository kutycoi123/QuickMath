class CourseFolder < ApplicationRecord
	has_many :notes
	belongs_to :user
end
