class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @users = User.all
    @posts = Post.all
    @usual_posts = Post.where(category:0)
    @lifehack_posts = Post.where(category:1)
    @play_posts = Post.where(category:2)
    @dish_posts = Post.where(category:3)
    @today = Date.today
    # 全投稿カウント
    @posts_today_count = @posts.where("DATE(created_at) = ?", Date.today).count
    @posts_yesterday_count = @posts.where("DATE(created_at) = ?", Date.today - 1.day).count
    @posts_this_week_count = @posts.where(created_at: Date.today - 1.week + 1.day..@today + 1.day).count
    @posts_last_week_count = @posts.where(created_at: Date.today - 2.week + 1.day..Date.today - 1.week + 1.day).count
    # ユーザーカウント
    @users_today_count = @users.where("DATE(created_at) = ?", Date.today).count
    @users_yesterday_count = @users.where("DATE(created_at) = ?", Date.today - 1.day).count
    @users_this_week_count = @users.where(created_at: Date.today - 1.week + 1.day..@today + 1.day).count
    @users_last_week_count = @users.where(created_at: Date.today - 2.week + 1.day..Date.today - 1.week + 1.day).count
  end
end
