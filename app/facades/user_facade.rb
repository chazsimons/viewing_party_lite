class UserFacade
  attr_reader :user, :parties

  def initialize(user)
    @user = user
    @parties = user.parties
  end

  def movie(party)
    Movie.new(service.details(party.movie_id))
  end

  def service
    MovieService.new
  end

  def host(party)
    User.find(party.creator_id).name
  end
end