class Admin::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def index
    @users = User.all.order(created_at: :desc)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to new_user_session_path
  end

  private

  # def ensure_correct_user
  #   @user = User.find(params[:id])
  #   unless @user == current_user
  #     redirect_to user_path(current_user)
  #   end
  # end

end
