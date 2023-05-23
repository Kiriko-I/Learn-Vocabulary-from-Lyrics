class User::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:id])
    current_user.follow(user)
		redirect_to request.referer
  end

  def destroy
    user = User.find(params[:id])
    current_user.unfollow(user)
		redirect_to request.referer
  end

  def followings
    user = User.find(params[:id])
		@users = user.followings.order(created_at: :desc)
  end

end
