class Public::SchedulesController < ApplicationController
  before_action :authenticate_user!
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
      flash[:notice] = "スケジュールを作成しました。"
      redirect_to society_schedules_path
    else
      flash[:notice] = "スケジュールの作成に失敗しました。"
      redirect_to society_schedules_path
    end

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
