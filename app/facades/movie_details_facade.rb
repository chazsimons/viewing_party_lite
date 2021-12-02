require './app/poros/cast_member'
require './app/poros/review'
require './app/poros/movie'

class MovieDetailsFacade
  attr_reader :movie_id, :user_id

  def initialize(movie_id, user_id)
    @movie_id = movie_id
    @user_id = user_id
  end

  def service
    MovieService.new
  end

  def user
    User.find(@user_id)
  end

  def users
    User.all
  end

  def movie
    Movie.new(service.details(@movie_id))
  end

  def cast
    service.cast(@movie_id)[:cast].map do |member|
      CastMember.new(member)
    end[0..9]
  end

  def reviews
    service.reviews(@movie_id)[:results].map {|review| Review.new(review)}
  end
end
