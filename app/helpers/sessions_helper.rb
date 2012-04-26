module SessionsHelper
	#if sign in at the login page 
	#this will provide @current with the user information in it
	def sign_in(user)
		cookies.permanent.signed[:remember_token] = [user.id,user.salt]
		current_user = user
	end
	#set the @current user
	def current_user=(user) 
		@current_user = user
	end
	
	# return user if we have token or @current_user else return nill
	def current_user 
		@current_user ||= user_from_remember_token		
	end 
	def signed_in?
	# user is sign in if currenct_user is not nill
		!current_user.nil?
	end
	private

	def user_from_remember_token
		User.authentication_with_salt(*remember_token)
	end
	#if we did't have token then nill array
	def remember_token
		cookies.signed[:remember_token] || [nil,nil]
		
	end
	def sign_out
		cookies.delete(:remember_token)
		current_user = nil
	end
end
