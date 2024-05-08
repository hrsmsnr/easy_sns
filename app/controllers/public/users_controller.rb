class Public::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
  end

  def unsubscribe
  end

  def withdraw
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:introduction,:email,:password)
  end
end
