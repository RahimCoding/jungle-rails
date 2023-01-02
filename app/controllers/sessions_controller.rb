class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
      if user = User.authenticate_with_credentials(params[:email], params[:password])
        # success logic, log them in
        session[:user_id] = user.id
        redirect_to '/'
      else
        # failure, render login form
        redirect_to '/login'
      end

end

end