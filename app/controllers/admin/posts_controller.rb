class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @usual_posts = Post.where(category:0).order("created_at DESC").page(params[:page]).per(5)
    @lifehack_posts = Post.where(category:1).order("created_at DESC").page(params[:page]).per(5)
    @play_posts = Post.where(category:2).order("created_at DESC").page(params[:page]).per(5)
    @dish_posts = Post.where(category:3).order("created_at DESC").page(params[:page]).per(5)
  end

  def show
    @post = Post.find(params[:id])
    @post_details = @post.post_details
    @comments = @post.comments.order("created_at DESC").page(params[:page]).per(6)
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to admin_post_path(post)
    else
      render :show
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_posts_path
  end

  private
  # 投稿ステータス変更用
  def post_params
    params.require(:post).permit(:is_public)
  end
end
