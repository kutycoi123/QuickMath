class PagesController < ApplicationController
	def welcome(errors = nil)
		@user = User.new
		@user_error = errors
	end
	def about
		
	end
end
