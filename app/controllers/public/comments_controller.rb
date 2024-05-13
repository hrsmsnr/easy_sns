class Public::CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    # comment = Comment.new(coment_params
    # comment.user_id = cirrent_user.id)
		# 上の二つの記述をしたのと同じ
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
