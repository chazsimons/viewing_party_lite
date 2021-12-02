class Movie
  attr_reader :title,
              :rating,
              :id,
              :poster,
              :summary,
              :genres,
              :runtime

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @rating = data[:vote_average]
    @poster = data[:poster_path]
    @summary = data[:overview]
    @genres = data[:genres]
    @runtime = data[:runtime]
  end

  def formated_time
    hours = @runtime / 60.0
    minutes = hours - hours.floor
    minutes *= 60
    "#{hours.floor} hour(s) and #{minutes.floor} minute(s)"
  end
end
