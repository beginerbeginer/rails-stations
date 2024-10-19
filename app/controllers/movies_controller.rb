class MoviesController < ApplicationController
  def index
    @movies = Movie.search(keyword: params[:keyword], is_showing: params[:is_showing])
  end
end
