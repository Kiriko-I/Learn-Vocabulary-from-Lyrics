class Admin::UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to new_user_session_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :prefecture, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end
