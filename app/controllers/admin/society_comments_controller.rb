class Admin::SocietyCommentsController < ApplicationController
  before_action :authenticate_admin!
  # 一旦送信と削除機能を作成。編集機能は後々追加予定
  def create
    society = Society.find(params[:society_id])
    comment = current_user.society_comments.new(society_comment_params)
    comment.society_id = society.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    comment = SocietyComment.find(params[:id])
    comment.destroy
    redirect_to request.referer
  end

  private
  
  def society_comment_params
    params.require(:society_comment).permit(:comment, :society_comment_image, :address, :latitude, :longitude)
  end
end
