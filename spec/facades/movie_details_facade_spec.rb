require 'rails_helper'

RSpec.describe MovieDetailsFacade do
  before :each do
    @facade = MovieDetailsFacade.new(75, 1)
  end

  describe 'movie' do
    it 'can list the info', :vcr do
      movie = @facade.movie

      expect(movie.title).to eq "Mars Attacks!"
      expect(movie.rating).to eq 6.4
      expect(movie.poster).to eq "/hll4O5vSAfnZDb6JbnP06GPtz7b.jpg"
      expect(movie.summery).to eq "'We come in peace' is not what those green men from Mars mean when they invade our planet, armed with irresistible weapons and a cruel sense of humor.  This star studded cast must play victim to the alien’s fun and games in this comedy homage to science fiction films of the '50s and '60s."

      expect(movie.genres).to be_a Array
      expect(movie.genres.length).to eq 3
      expect(movie.genres.first[:name]).to eq "Comedy"

      expect(movie.runtime).to eq 106
    end
  end

  describe 'cast' do
    it 'should return the cast info', :vcr do
      cast = @facade.cast

      expect(cast).to be_a Array
      expect(cast.length).to eq 10
      expect(cast.first.name).to eq "Jack Nicholson"
      expect(cast.first.character).to eq "President James Dale / Art Land"
    end
  end

  describe 'reviews' do
    it 'should return the review info', :vcr do
      reviews = @facade.reviews

      expect(reviews).to be_a Array
      expect(reviews.length).to eq 1
      expect(reviews.first.author).to eq "Kamurai"
      expect(reviews.first.content).to eq "Good watch, could watch again, but it's hard to honestly recommend.\r\n\r\nThis is one of those movies that is good because it is bad, whether or not that is done on purpose, for the purposes of parody.  Otherwise it's just a good old jump in \"The Way Back Machine\" to see a litany of cameos or cheap parts by almost anyone who was famous in the mid-1990s.  Though I do feel like most of the actors I liked were essentially wasted, but it is possible that was by design so the Martians could keep the focus for the majority of the movie.\r\n\r\nRethinking on the movie almost makes me want a modernization, it has so many little quirks and nuances that really brings it to a special experience.  Even if you think it looks terrible, throw this on your queque and slot it in for a Bad Movie Night."
    end
  end
end