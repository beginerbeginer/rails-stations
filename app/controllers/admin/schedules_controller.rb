class Admin::SchedulesController < ApplicationController
  before_action :set_movie, only: [:new, :create]
  before_action :set_schedule, only: [:edit, :update, :destroy]

  def index
    @schedules = Schedule.includes(:movie).all
  end

  def new
    @schedule = @movie.schedules.build
  end

  def create
    @schedule = @movie.schedules.build(schedule_params)
    if @schedule.save
      redirect_with_notice(admin_movies_path, 'スケジュールが登録されました')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      redirect_with_notice(admin_movies_path(@schedule.movie), 'スケジュールが更新されました')
    else
      render :edit
    end
  end

  def destroy
    @schedule.destroy
    redirect_with_notice(admin_movies_path(@schedule.movie), 'スケジュールが削除されました')
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:start_time, :end_time)
  end

  def redirect_with_notice(path, message)
    redirect_to path, notice: message
  end
end
