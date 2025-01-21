class Public::MembershipsController < ApplicationController
  before_action :authenticate_user!

  def create
    society = Society.find(params[:society_id])
    user = current_user
    society.users << user
    redirect_to society_path(society.id)
  end

  def destroy
    society = Society.find(params[:society_id])
    user = current_user
    society.users.delete(user)
    redirect_to society_path(society.id)
  end
end
