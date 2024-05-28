class SearchesController < ApplicationController
  before_action :authenticate_user!

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
end
