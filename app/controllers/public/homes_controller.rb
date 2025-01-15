class Public::HomesController < ApplicationController

  def top
    @societies = Society.all
    @user = User.find(current_user.id)
  end
end
