class CourseFolder < ApplicationRecord
	has_many :notes, :dependent => :delete_all
	belongs_to :user
    acts_as_votable
	validates :name, presence: true
	validates :year, presence: true
	validates :term, presence: true
	validates :title, presence: true
end
