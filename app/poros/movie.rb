class Movie
  attr_reader :title, :rating, :id

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @rating = data[:vote_average]

    # poster path is https://image.tmdb.org/t/p/w200
    @poster = data[:poster_path]
  end
end
