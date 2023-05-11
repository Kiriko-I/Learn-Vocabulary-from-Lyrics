class User::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]

  def mypage
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    if user.update(user_params)
      redirect_to mypage_path, notice: 'ユーザー情報を更新しました。'
    else
      @user = current_user
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :prefecture)
  end

  def ensure_guest_user
    @user = current_user
    if @user.name == "guestuser"
      @user = current_user
      redirect_to mypage_path, notice: 'ゲストはプロフィール編集画面へ遷移できません。'
    end
  end

end
