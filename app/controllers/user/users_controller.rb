class User::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit, :update, :destroy]

  def mypage
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    if user.update(user_params)
      flash[:success] = 'ユーザー情報を更新しました。'
      redirect_to mypage_path
    else
      @user = current_user
      render 'edit'
    end
  end

  def destroy
    user = current_user
    user.destroy
    flash[:danger] = '退会しました。'
    redirect_to new_user_registration_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :nickname, :prefecture)
  end

  def ensure_guest_user
    @user = current_user
    if @user.name == 'guestuser'
      @user = current_user
      flash[:danger] = 'ゲストはプロフィールを編集できません。'
      redirect_to posts_path
    end
  end

end
