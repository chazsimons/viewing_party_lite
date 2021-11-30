require 'rails_helper'

RSpec.describe MovieFacade do
  describe 'top rated' do
    it 'can return 40 top rated films', :vcr do
      facade = MovieFacade.new
      top_films = facade.top_rated

      expect(top_films).to be_an(Array)
      expect(top_films.count).to eq(40)
      expect(top_films.first.title).to eq("Dilwale Dulhania Le Jayenge")
      expect(top_films.last.title).to eq("Grave of the Fireflies")
    end
  end
end
