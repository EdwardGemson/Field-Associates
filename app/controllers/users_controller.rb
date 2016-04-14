class UsersController < ApplicationController
  skip_before_action :ensure_current_user
  def new
    @user = User.new
  end
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Thanks for registering!"
      redirect_to about_path
    end

  end
end