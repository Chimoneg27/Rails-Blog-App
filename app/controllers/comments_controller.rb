class CommentsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = @user.id

    if @comment.save
      redirect_to user_post_path(@user, @post)
    else
      render :new, alert: 'Comment not created'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:Text)
  end
end
