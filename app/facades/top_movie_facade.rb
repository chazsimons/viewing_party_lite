require './app/poros/movie.rb'
class TopMovieFacade
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
