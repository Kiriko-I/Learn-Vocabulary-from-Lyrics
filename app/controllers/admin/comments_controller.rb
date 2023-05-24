class Admin::CommentsController < ApplicationController
  
  def destroy
    post = Post.find(params[:post_id])
    @comment = Comment.find_by(id: params[:id], post_id: post)
    @comment.destroy
    flash[:warning] = 'コメントを削除しました。'
    redirect_to admin_post_path(post)
  end
end
