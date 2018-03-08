class CourseFolder < ApplicationRecord
	has_many :notes, :dependent => :delete_all
	belongs_to :user
	validates :name, presence: true, allow_nil: true
	validates :year, presence: true, allow_nil: true
	validates :term, presence: true, allow_nil: true
	validates :title, presence: true, allow_nil: true
end
