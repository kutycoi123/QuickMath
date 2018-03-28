class User < ApplicationRecord

	attr_accessor :remember_token, :activation_token #remember_token for remember me feature, activation_token for account activation

	before_create :create_activation_digest
	
    acts_as_voter
    
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
 	def authenticated?(attribute, token)
   		digest = send("#{attribute}_digest")
   		return false if digest.nil?
	  	BCrypt::Password.new(digest).is_password?(token)
	end
	#forgets user so that they can log out after using "remember me"
	def forget
		update_attribute(:remember_digest, nil)
	end
    # Activate account
    def activate
	    update_attribute(:activated,    true)
	    update_attribute(:activated_at, Time.zone.now)
    	# update_columns(activated: true, activated_at: Time.zone.now)
    end
    # Send activation email
    def send_activation_email
    	UserMailer.account_activation(self).deliver_now
    end
    private
    	# Creates & assigns activation token and digest.
    	def create_activation_digest
    		self.activation_token  = User.new_token #create activation token
    		self.activation_digest = User.digest(activation_token) #create activation digest
    	end
end
