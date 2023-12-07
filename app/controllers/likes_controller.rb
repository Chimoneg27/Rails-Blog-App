class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = @post.likes.build
    @like.user_id = @user.id

    if @like.save
      redirect_to user_post_path(@user, @post)
    else
      render :new, alert: 'Like not created'
    end
  end

  private

  def like_params
    params.require(:like).permit(:Text)
  end
end
