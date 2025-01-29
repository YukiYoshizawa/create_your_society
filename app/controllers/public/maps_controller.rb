class Public::MapsController < ApplicationController
  def show
    @society_comment = SocietyComment.find(params[:id])
    @society = @society_comment.society
    @user_societies = current_user.societies
    unless @user_societies.include?(@society)
      redirect_to society_path(@society.id), notice:"地図機能は加入メンバーのみが閲覧できます"
    end
  end
end
