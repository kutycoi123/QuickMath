class User < ApplicationRecord
	has_many :notes
	has_and_belongs_to_many :courses
<<<<<<< HEAD

=======
>>>>>>> 721266809624b699f5477df52229865e1f0e8966
	def my_authenticate(password)
		return self.password_digest == Digest::SHA1.hexdigest(password)  
	end
end
