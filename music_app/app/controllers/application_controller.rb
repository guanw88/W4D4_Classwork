class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :log_in_user!

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_in_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def redirect_to_signup_if_not_logged_in
    redirect_to new_user_url if !logged_in?
  end
end
