class Movie
  attr_reader :title, :rating, :id

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @rating = data[:vote_average]
  end
end
