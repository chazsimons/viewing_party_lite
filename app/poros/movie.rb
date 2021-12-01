class Movie
  attr_reader :title,
              :rating,
              :id,
              :poster,
              :summery,
              :genres,
              :runtime

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @rating = data[:vote_average]

    # poster path is https://image.tmdb.org/t/p/w200
    @poster = data[:poster_path]
    @summery = data[:overview]
    @genres = data[:genres]
    @runtime = data[:runtime]
  end
end
