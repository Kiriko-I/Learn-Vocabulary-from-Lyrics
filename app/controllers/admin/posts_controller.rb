class Admin::PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

end
