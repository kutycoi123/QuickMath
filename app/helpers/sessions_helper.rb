module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id
	end
	# Remembers user in persistent session (cookies)
	def remember(user)
		user.remember #generate remember token and save digest to db
		cookies.permanent.signed[:user_id] = user.id #create permanent cookie for user id
		cookies.permanent[:remember_token] = user.remember_token #remember token
	end
	#Forget persistent session (so that user can log out)
	#call from log_out helper
	def forget(user)
	  user.forget
	  cookies.delete(:user_id) #delete user_id cookie
	  cookies.delete(:remember_token) #delete remember_token cookie
	end
	# Return user corresponding to the remember token cookie
	def current_user
	  if (user_id = session[:user_id])
	    @current_user ||= User.find_by(id: user_id)
	  elsif (user_id = cookies.signed[:user_id])
	    user = User.find_by(id: user_id)
	    if user && user.authenticated?(cookies[:remember_token])
	      log_in user
	      @current_user = user
	    end
	  end
	end
	# def current_user
	# 	user = nil
	# 	if session[:user_id]
	# 		user = User.find_by(id: session[:user_id])
	# 	end
	# 	@current_user = user
	# end
	def log_out
		forget(current_user) #call user.forget
		session.delete(:user_id)
		@current_user = nil
	end
	def correct_user?(user)
		user == current_user
	end
	def logged_in?
		!current_user.nil?
	end

end
