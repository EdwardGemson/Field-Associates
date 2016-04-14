class UsersController < ApplicationController
  skip_before_action :ensure_current_user

  def index
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Thanks for registering!"
      redirect_to about_path
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @user.username = @user.username.capitalize
  end

  def edit
    @user = User.find_by(id: params[:id])
  end
  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end