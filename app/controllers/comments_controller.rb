class CommentsController < ApplicationController
  load_and_authorize_resource
  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = @user.id

    if @comment.save
      redirect_to user_post_path(@user, @post)
    else
      render :new, alert: 'Comment not created'
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

  private

  def comment_params
    params.require(:comment).permit(:Text)
  end
end
