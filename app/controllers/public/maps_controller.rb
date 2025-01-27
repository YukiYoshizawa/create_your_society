class Public::MapsController < ApplicationController
  def show
    @society_comment = SocietyComment.find(params[:id])
  end
end
