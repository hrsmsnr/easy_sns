class Admin::PostsController < ApplicationController
  def index
    @usual_posts = Post.where(category:0).order("created_at DESC")
    @lifehack_posts = Post.where(category:1).order("created_at DESC")
    @play_posts = Post.where(category:2).order("created_at DESC")
    @dish_posts = Post.where(category:3).order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
    @post_details = @post.post_details
    @comments = @post.comments
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
