class User < ApplicationRecord
	has_many :notes
	has_and_belongs_to_many :courses

	def my_authenticate(password)
		return self.password_digest == Digest::SHA1.hexdigest(password)  
	end
end
