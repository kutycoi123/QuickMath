class CourseFolder < ApplicationRecord
	has_many :notes, :dependent => :delete_all
	belongs_to :user
	validates :name, presense: :true
	validates :year, presense: :true
	validates :term, presense: :true
	validates :title, presense: :true
end
