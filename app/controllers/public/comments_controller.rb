class Public::CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    # comment = Comment.new(coment_params
    # comment.user_id = cirrent_user.id)
		# 上の二つの記述をしたのと同じ
    @comment.post_id = @post.id
    if @comment.save
      flash[:success] = 'コメントの投稿が完了しました'
      redirect_to post_path(@post)
    else
      flash[:error] = 'コメントの投稿に失敗しました'
      redirect_to post_path(@post)
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:success] = 'コメントの削除が完了しました'
    redirect_to post_path(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
