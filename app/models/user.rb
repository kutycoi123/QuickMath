class User < ApplicationRecord
	has_secure_password
	has_many :notes
	has_many :course_folders

	validates :name, presence: true, length: {maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 255},
				format: {with: VALID_EMAIL_REGEX},
				uniqueness: { case_sensitive: false}
	validates :password, presence: true, length: {minimum: 6}, allow_nil: true
	# def my_authenticate(password)
	# 	return self.password_digest == Digest::SHA1.hexdigest(password)  
	# end
end