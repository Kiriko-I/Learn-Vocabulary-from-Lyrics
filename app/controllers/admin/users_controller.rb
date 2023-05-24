class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

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
    flash[:warning] = 'ユーザーを削除しました'
    redirect_to admin_users_path
  end

end
