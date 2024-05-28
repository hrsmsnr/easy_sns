class SearchesController < ApplicationController
  before_action :authenticate_user_or_admin!

  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "ユーザー"
      @users = User.looks(params[:search], params[:word]).page(params[:page]).per(10)
      render "searches/search_result"
    elsif @range =="投稿"
      @posts = Post.looks(params[:search], params[:word]).page(params[:page]).per(10)
      render "searches/search_result"
    else
      redirect_to request.referer
    end
  end
  private

  def authenticate_user_or_admin!
    unless user_signed_in? || admin_signed_in?
      # ユーザーも管理者もサインインしていない場合、適切なリダイレクトやエラーメッセージを設定します
      redirect_to new_user_session_path, alert: "You need to sign in as a user or admin."
    end
  end
end
