module PagesHelper
	@@signupErrors = [];
	@@loginErrors = [];
	def self.getSignUpErrors
		@@signupErrors
	end
	def self.getLoginErrors
		@@loginErrors
	end
	
	def setSignUpErrors(errors )
		@@signupErrors = errors
	end
	def setLoginErrors(errors)
		@@loginErrors = errors
	end
	def setSignUpErrorsDetected(errors = false)
		session[:signup_error] = errors
	end
	def setLoginErrorsDetected(errors = false)
		session[:login_error] = errors
	end
	def singupErrorsDetected?
		if session[:signup_error]
			return true
		end
		return false
	end
	def loginErrorsDetected?
		if session[:login_error]
			return true
		end
		return false
	end



end
