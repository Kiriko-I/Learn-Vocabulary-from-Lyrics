class Admin::PostsController < ApplicationController

  def show
    @post = Post.find(params[:id]).order(created_at: :desc)
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_posts_path
  end

  private

end
