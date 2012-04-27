class SessionsController < ApplicationController
  def new
	@title = 'Sign in'
  end
  def create
  	user = User.authentication(params[:session][:email],
  							 params[:session][:password])
	if user.nil?
		flash.now[:error] = "Invalid email/password combination"
		@title = "sign in"
		render 'new'
	else
    # this will create token and @current_user
    sign_in(user)
		redirect_to user
	end
  	
  end
  def destroy
    sign_out
    redirect_to root_path
  end

end