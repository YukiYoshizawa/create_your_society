class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  # ログインしているか否かの確認

  def show
    @user = current_user
    @societies = @user.societies

  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:notice] = "ユーザーデータを更新しました"
      redirect_to users_my_page_path
    else
      flash.now[:notice] = "エラー"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :is_active, :profile_image)
  end
end
