class Public::SocietiesController < ApplicationController
  def index
    @societies = Society.all
    @user = User.find(current_user.id)
  end

  def show
    @society = Society.find(params[:id])
    # @user = User.find(params[:id])
  end

  def new
    @society = Society.new
  end


  # createの画像処理の部分でエラーあり
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
  end

  def update
    if @society.update(society_params)
      redirect_to society_path(@society.id)
    else
      render "edit"
    end
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
