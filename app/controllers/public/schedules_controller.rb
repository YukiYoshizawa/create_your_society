class Public::SchedulesController < ApplicationController

  def index
    @schedules = Schedule.all
    @schedule = Schedule.new
  end

  def new
    @schedule = Schedule.new
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.society = Society.find(params[:society_id])
    @schedule.user_id = current_user.id

    if @schedule.save
      puts @schedule.errors.full_messages
      flash[:notice] = "successfully"
      redirect_to society_schedules_path
    else
      puts @schedule.errors.full_messages
      flash[:notice] = "error"
      redirect_to society_schedules_path
    end

    # Schedule.create(schedule_params)
    # redirect_to society_schedules_path
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to society_schedules_path, notice:"削除しました"
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to society_schedules_path(@schedule.society_id, @schedule.id), notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:title, :content, :start_time, :society_id, :user_id)
  end

end
