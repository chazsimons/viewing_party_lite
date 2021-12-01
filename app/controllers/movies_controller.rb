class MoviesController < ApplicationController
  def show
  end

  def index
    if params[:q] == "top%40rated"
      @facade = TopMovieFacade.new(params[:id])
    else
      @facade = SearchMovieFacade.new(params[:q], params[:id])
    end
  end
end
