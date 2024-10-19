class Admin::MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to admin_movies_path, notice: '映画が登録されました'
    else
      flash[:alert] = '映画の登録に失敗しました。同じタイトルの映画は登録できません'
      render :new
    end
  rescue StandardError => e
    flash[:alert] = "エラーが発生しました： #{e.message}"
    render :new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to admin_movies_path, notice: '映画が更新されました'
    else
      flash[:alert] = '映画の更新に失敗しました。同じタイトルの映画は登録できません'
      render :edit
    end
  rescue StandardError => e
    flash[:alert] = "エラーが発生しました： #{e.message}"
    render :edit
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to admin_movies_path, notice: '映画が削除されました'
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :year, :description, :image_url, :is_showing)
  end
end
