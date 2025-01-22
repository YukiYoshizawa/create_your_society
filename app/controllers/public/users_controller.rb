class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  # ログインしているか否かの確認

  def show
    @user = current_user
    @societies = @user.societies

  end

  def edit

  end

  def update

  end

  private

  def user_params

  end
end
