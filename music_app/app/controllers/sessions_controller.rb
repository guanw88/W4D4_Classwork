class SessionsController < ApplicationController

  def new #login screen
    render :new
  end

  def create #log in user
    @current_user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @current_user
      log_in_user!(@current_user)
      redirect_to user_url(@current_user)
    end
  end

  def destroy #log out user
    if logged_in?
      current_user.reset_session_token!
      session[:session_token] = nil
      redirect_to new_session_url
    end
  end



end
