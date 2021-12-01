class MovieService
  def films_1
    response = Faraday.get("https://api.themoviedb.org/3/movie/top_rated", {api_key: ENV['movie_api'], page: 1})
    JSON.parse(response.body, symbolize_names: true)
  end

  def films_2
    response = Faraday.get("https://api.themoviedb.org/3/movie/top_rated", {api_key: ENV['movie_api'], page: 2})
    JSON.parse(response.body, symbolize_names: true)
  end

  def search_1(query)
    response = Faraday.get("https://api.themoviedb.org/3/search/movie", {api_key: ENV['movie_api'], query: query, page: 1})
    JSON.parse(response.body, symbolize_names: true)
  end

  def search_2(query)
    response = Faraday.get("https://api.themoviedb.org/3/search/movie", {api_key: ENV['movie_api'], query: query, page: 2})
    JSON.parse(response.body, symbolize_names: true)
  end

  def details(movie_id)
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}", {api_key: ENV['movie_api']})

    JSON.parse(response.body, symbolize_names: true)
  end

  def cast(movie_id)
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}/credits", {api_key: ENV['movie_api']})

    JSON.parse(response.body, symbolize_names: true)
  end

  def reviews(movie_id)
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}/reviews", {api_key: ENV['movie_api']})

    JSON.parse(response.body, symbolize_names: true)
  end
end
