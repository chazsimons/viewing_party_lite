require 'rails_helper'

RSpec.describe TopMovieFacade do
  describe 'movies' do
    it 'can return 40 top rated films', :vcr do
      facade = TopMovieFacade.new
      top_films = facade.movies
      first_film = top_films.first
      last_film = top_films.last

      expect(top_films).to be_an(Array)
      expect(top_films.count).to eq(40)
      expect(top_films.first.title).to eq(first_film.title)
      expect(top_films.last.title).to eq(last_film.title)
    end
  end
end
