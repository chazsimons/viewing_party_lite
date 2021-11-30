class MovieService
  def films_1
    response = Faraday.get("https://api.themoviedb.org/3/movie/top_rated", {api_key: ENV['movie_api'], page: 1})
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def films_2
    response = Faraday.get("https://api.themoviedb.org/3/movie/top_rated", {api_key: ENV['movie_api'], page: 2})
    data = JSON.parse(response.body, symbolize_names: true)
  end
end
