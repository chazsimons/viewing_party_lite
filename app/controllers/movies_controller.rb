class MoviesController < ApplicationController
  def show
  end

  def index
    if params[:q] == "top%40rated"
      @facade = TopMoviesFacade.new
    else
      @facade = SearchMovieFacade.new(params[:q])
    end
  end
end
