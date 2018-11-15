class UsersController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new]


  def create #create user
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new #show the new user signup page
    @user = User.new
    render :new
  end

  def show #show details about an individual user
    @user = User.find_by(id: params[:id])
    render :show
  end

  def redirect_if_logged_in
    redirect_to user_url(current_user) if logged_in?
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
