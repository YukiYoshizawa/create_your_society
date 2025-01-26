class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @societies = @user.societies
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザーデータを更新しました"
      redirect_to admin_users_show_path(@user.id)
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
