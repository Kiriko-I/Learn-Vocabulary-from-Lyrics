class User::CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    # ↑下記の記述をまとめたもの
    # @comment = Comment.new(comment_params)
    # @comment.user_id = current_user.id    
    @comment.post_id = post.id
    @comment.save
    redirect_back(fallback_location: posts_path)
  end

  def destroy
    @comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
    @comment.destroy
    redirect_back(fallback_location: posts_path)
  end

  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end

end
