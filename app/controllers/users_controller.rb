class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params['id'])
  end

  def generate_token
    @user = User.find(current_user.id)
    @user.generate_token
    if @user.save
      flash[:success] = 'Token generated successfully'
    else
      flash[:error] = @user.errors.full_messages.join(', ')
    end
    redirect_to user_path(@user)
  end
end
