class User::PostsController < ApplicationController
  # before_action :authenticate_user!
  # before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all.order(params[:sort])
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      @post.save_tags(tag_list)
      redirect_to post_path(@post), notice: "You have created new post successfully."
    else
      @posts = Post.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "You have updated post successfully."
    else
      render "edit"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:prefecture, :city, :landmark, :sidewalk, :snow_state, :message)
  end

  # def ensure_correct_user
  #   @post = post.find(params[:id])
  #   unless @post.user == current_user
  #     redirect_to posts_path
  #   end
  # end
end