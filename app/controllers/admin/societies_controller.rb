class Admin::SocietiesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @societies = Society.all.page(params[:page])
  end

  def show
    @society = Society.find(params[:id])
    @society_comment = SocietyComment.new
    
    owner_id = @society.owner_id
    @users_without_owner = User.joins(:user_societies).where.not(id: owner_id)
  end

  def edit
    @society = Society.find(params[:id])
  end

  def update
    @society = Society.find(params[:id])
    if @society.update(society_params)
      redirect_to admin_society_path(@society.id)
    else
      render "edit"
    end
  end

  def destroy
    society = Society.find(params[:id])
    society.destroy
    redirect_to root_path
  end

  private

  def society_params
    params.require(:society).permit(:title, :introduction, :society_image, :latitude, :longitude)
  end
end
