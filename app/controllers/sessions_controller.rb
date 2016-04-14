class SessionsController < ApplicationController
  skip_before_action :ensure_current_user

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash.notice = "Welcome back #{user.username}"
      redirect_to root_path
    else
      flash[:error] = "Login failed, please try again"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end