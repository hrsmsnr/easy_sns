class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all.order("created_at DESC").page(params[:page]).per(3)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC").page(params[:page]).per(3)
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    flash[:success] = "ユーザー情報の更新が完了しました"
    redirect_to admin_user_path(user)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:success] = "ユーザー情報の削除が完了しました"
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit(:is_active)
  end

end
