class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
    detail = @post.post_details.build
    detail.sequence_number = 1
  end

  def index
    @usual_posts = Post.where(category:0).order("created_at DESC")
    @lifehack_posts = Post.where(category:1).order("created_at DESC")
    @play_posts = Post.where(category:2).order("created_at DESC")
    @dish_posts = Post.where(category:3).order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
    @post_details = @post.post_details.order("sequence_number ASC")
    @comment = Comment.new
    @comments = @post.comments.order("created_at DESC")
    @user = @post.user
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      assign_sequence_numbers
      flash[:success] = "新規投稿が完了しました"
      redirect_to post_path(@post)
    else
      flash.now[:error] = "投稿に失敗しました"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @post_details = @post.post_details.order("sequence_number ASC")
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "投稿情報の更新が完了しました"
      redirect_to post_path(@post)
    else
      flash.now[:error] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:success] = '投稿の削除が完了しました'
    redirect_to users_my_page_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category, :post_image, post_details_attributes: [:id, :body, :sequence_number, :_destroy])
  end

  def assign_sequence_numbers
    @post.post_details.each_with_index do |detail, index|
      detail.sequence_number = index + 1
    end
  end

  def is_matching_login_user
    @post = Post.find(params[:id])
    unless @post.user_id == current_user.id
      redirect_to posts_path
    end
  end
end
