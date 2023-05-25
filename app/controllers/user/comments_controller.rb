class User::CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = post.id
    if @comment.save
      flash[:success] = 'コメントを投稿しました。'
      redirect_to post_path(post)
    else
      @post = post
      render "user/posts/show"
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    @comment = Comment.find_by(id: params[:id], post_id: post)
    @comment.destroy
    flash[:warning] = 'コメントを削除しました。'
    redirect_to post_path(post)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
