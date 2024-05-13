class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    if request.path == '/users/my_page'
      @user = current_user
    else
      @user = User.find(params[:id])
      if @user == current_user
        redirect_to users_my_page_path
      end
    end

    # if request.path == '/users/my_page'
    #   @user = current_user
    # else
    #   @user = User.find(params[:id])
    # end
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
