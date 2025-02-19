class Public::HomesController < ApplicationController

  def top
    @societies = Society.all.page(params[:page])
    # @user = User.find(current_user.id)
  end
end
