require 'rails_helper'

RSpec.describe 'New Party' do
  describe 'happy path' do
    before :each do
      @user_1 = create(:user)
      @facade = MovieDetailsFacade.new(75, @user_1.id)
      @movie = @facade.movie
    end

    it 'provides a form to create a new party', :vcr do
      visit "/users/#{@user_1.id}/movies/#{@movie.id}/viewing-party/new"

      expect(page).to have_content("Create a Viewing Party for #{@movie.title}!")
      expect(page).to have_field(:length, with: @movie.runtime)
    end
  end
end
