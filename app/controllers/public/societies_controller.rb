class Public::SocietiesController < ApplicationController
  def index
    @societies = Society.all
    @user = User.find(current_user.id)
  end

  def show
    @society = Society.find(params[:id])
    @society_comment = SocietyComment.new
    # @user = User.find(params[:id])
  end

  def new
    @society = Society.new
  end


  def create
    @society = Society.new(society_params)
    @society.owner_id = current_user.id
    if @society.save
      redirect_to society_path(@society.id)
    else
      render 'new'
    end
  end

  def edit
    @society = Society.find(params[:id])
  end

  def update
    @society = Society.find(params[:id])
    if @society.update(society_params)
      redirect_to society_path(@society.id)
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

  def ensure_correct_user
    @society = Society.find(params[:id])
    unless @society.owner_id == current_user.id
      redirect_to root_path
    end
  end
end
