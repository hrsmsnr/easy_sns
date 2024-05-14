class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :withdraw]

  def index
    @users = User.all
  end

  def show
    # マイページではログイン中のユーザーを表示
    if request.path == '/users/my_page'
      @user = current_user
    ##
    else
      @user = User.find(params[:id])
      # ログイン中のユーザーページに移動する際マイページに移動
      if @user == current_user
        redirect_to users_my_page_path
      end
      ##
    end

    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    user = current_user
    user.update_column(:is_active, false)
    reset_session
    redirect_to new_user_registration_path
    # redirect_to new_registration_path(resource_name)
  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction,:email)
  end

  def ensure_correct_user
    # user = User.find(params[:id])
    user = current_user
    unless user.id == current_user.id
      redirect_to users_my_page_path
    end
  end
end
