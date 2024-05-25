class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
      render "public/searches/search_result"
    elsif @range =="Post"
      @posts = Post.looks(params[:search], params[:word])
      render "public/searches/search_result"
    else
      redirect_to request.referer
    end
  end
end