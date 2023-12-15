class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = 'Post deleted successfully'
    else
      flash[:error] = 'Error: Post could not be deleted'
    end
    redirect_to user_posts_path(current_user)
  end

  def show
    @post = Post.find_by_id(params[:id])
    @comment = Comment.all
    @user = User.find_by_id(params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.likes_counter = 0
    @post.comments_counter = 0

    if @post.save
      redirect_to user_post_path(current_user, @post)
    else
      render :new, alert: 'Post not created'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
