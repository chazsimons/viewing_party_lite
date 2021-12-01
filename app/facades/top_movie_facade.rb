require './app/poros/movie.rb'
class TopMovieFacade
  attr_reader :user_id
  def initialize(user_id = nil)
    @user_id = user_id
  end

  def movies
    films_1 = service.films_1[:results]
    films_2 = service.films_2[:results]
    films = films_1 + films_2
    films.map do |data|
      Movie.new(data)
    end
  end

  def service
    MovieService.new
  end
end
