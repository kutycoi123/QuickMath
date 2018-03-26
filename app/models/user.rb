class User < ApplicationRecord

	attr_accessor :remember_token #for remember me feature
	
	has_many :course_folders

	validates :name, presence: true, length: {maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 255},
				format: {with: VALID_EMAIL_REGEX},
				uniqueness: { case_sensitive: false}
	has_secure_password
	validates :password, presence: true, length: {minimum: 6}, allow_nil: true
	# def my_authenticate(password)
	# 	return self.password_digest == Digest::SHA1.hexdigest(password)  
	# end

  	# Returns hash digest of given str
  	def User.digest(string)
    	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    	BCrypt::Password.create(string, cost: cost)
  	end

  	# Returns random token.
  	def User.new_token
    	SecureRandom.urlsafe_base64
  	end

  	#remember user in db for use in persistent sessions (cookies)
	def remember
		#this assignment sets user's remember_token attribute
		self.remember_token = User.new_token 
		#use update_attribute method to update remember digest
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	# Return true if given token matches digest
	def authenticated?(remember_token)
		return false if remember_digest.nil? 
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	#forgets user so that they can log out after using "remember me"
	def forget
		update_attribute(:remember_digest, nil)
	end

end