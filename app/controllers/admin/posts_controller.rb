class Admin::PostsController < ApplicationController
  def index
    @usual_posts = Post.where(category:0)
    @lifehack_posts = Post.where(category:1)
    @play_posts = Post.where(category:2)
    @dish_posts = Post.where(category:3)
  end

  def show
    @post = Post.find(params[:id])
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
