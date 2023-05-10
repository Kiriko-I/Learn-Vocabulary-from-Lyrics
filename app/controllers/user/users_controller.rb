class User::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def index
    @users = User.all
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_users_path
  end

end
