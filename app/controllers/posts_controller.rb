class PostsController < ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])
    @posts = Post.all
  end

  def show
    @post = Post.find_by_id(params[:id])
    @comment = Comment.all
    @user = User.find_by_id(params[:user_id])
  end
end