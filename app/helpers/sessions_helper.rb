module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id
	end
	def log_out
		session.delete(:user_id)
		forget(@current_user)
		@current_user = nil
	end
	def remember(user)
		user.remember
		cookies.permanent.signed[:user_id] = user.id
		cookies.permanent[:remember_token] = user.remember_token
	end
	def forget(user)
		user.forget
		cookies.delete(:user_id)
		cookies.delete(:remember_token)
	end
	def current_user
		if (userId = session[:user_id])
			@current_user ||= User.find_by(id: userId)
		elsif (userId = cookies.signed[:user_id])
			user ||= User.find_by(id: userId)
			if user && user.authenticated?(:remember, cookies[:remember_token])
				@current_user = user
				log_in user
			end
		end
	end

	def logged_in?
		!current_user.nil?
	end
	def correct_user?(user)
		user == current_user
	end
end
