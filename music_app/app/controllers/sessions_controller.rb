class SessionsController < ApplicationController
  helper_method :current_user

  def new #login screen
    render :new
  end

  def create #log in user
  end

  def destroy #log out user
    if logged_in?
      current_user.reset_session_token!
      session[:session_token] = nil
      redirect_to new_session_url
    end
  end

  def current_user
    @current_user ||= User.find_by(session_token: params[:user][:session_token])
  end

  def logged_in?
    current_user.nil? == false
  end

  def log_in_user!(user)
  end

end
