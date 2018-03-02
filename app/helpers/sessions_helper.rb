module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id
	end
	def log_out
		session.delete(:user_id)
		@current_user = nil
	end
	def current_user
		user = nil
		if session[:user_id]
			user = User.find_by(id: session[:user_id])
		end
		@current_user = user
	end
	def correct_user?(user)
		user == current_user
	end
	def logged_in?
		!current_user.nil?
	end
end
