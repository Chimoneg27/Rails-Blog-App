class CommentsController < ApplicationController
  before_action :set_user_and_post, only: %i[new create]
  load_and_authorize_resource
  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.build(comment_params.merge(user_id: current_user.id))

    if @comment.save
      flash[:success] = 'Comment saved successfully'
      redirect_back(fallback_location: user_post_path(@user, @post))
    else
      flash.now[:error] = 'Error: Comment could not be saved'
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    if @comment.destroy
      flash[:success] = 'Comment deleted successfully'
    else
      flash[:error] = 'Error: Comment could not be deleted'
    end

    redirect_back(fallback_location: root_path)
  end

  def set_user_and_post
    @user = User.includes(posts: :comments).find(params[:user_id])
    @post = @user.posts.includes(:comments).find(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:Text)
  end
end
