class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    society = Society.find(params[:society_id])
    favorite = current_user.favorites.new(society_id: society.id)
    favorite.save
    redirect_to request.referer
  end
  
  def destroy
    society = Society.find(params[:society_id])
    favorite = current_user.favorites.find_by(society_id: society.id)
    favorite.destroy
    redirect_to request.referer
  end
end
