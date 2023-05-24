class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:warning] = '投稿を削除しました'
    redirect_to admin_posts_path
  end

end