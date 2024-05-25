class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]
  before_action :ensure_user_logged_in, only: [:withdraw]
  before_action :ensure_guest_user, only: [:edit]
  def index
    @users = User.all
  end

  def show
    # マイページではログイン中のユーザーを表示
    if request.path == '/users/my_page'
      @user = current_user
    #----------------------
    else
      @user = User.find(params[:id])
      # ログイン中のユーザーページに移動する際マイページに移動
      if @user == current_user
        redirect_to users_my_page_path
      end
      #----------------------
    end
    @posts = @user.posts.order("created_at DESC")
    # 全いいね数カウント
    @favorites_count = 0
    @posts.each do |post|
      @favorites_count += post.favorites.count
    end
    # 全コメント数カウント
    @comments_count = 0
    @posts.each do |post|
      @comments_count += post.comments.count
    end
  end
  
  def follows
    user = User.find(params[:user_id])
    @users = user.following_users
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.follower_users
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'ユーザー情報を更新しました'
      redirect_to @user
    else
      flash.now[:error] = 'ユーザー情報を更新できませんでした'
      render :edit
    end
  end

  def withdraw
    user = current_user
    user.update_column(:is_active, false)
    reset_session
    flash[:success] = '退会が完了しました'
    redirect_to new_user_registration_path
  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction,:email,:user_image)
  end

  def ensure_correct_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to users_my_page_path
    end
  end

  def ensure_user_logged_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def ensure_guest_user
    @user = current_user
    if @user.guest_user?
      flash[:error] = 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
      redirect_to users_my_page_path
    end
  end
end
