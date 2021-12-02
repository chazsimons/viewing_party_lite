require 'rails_helper'

RSpec.describe 'New Party' do
  describe 'happy path' do
    before :each do
      @user_1 = create(:user)
      @user_2 = create(:user)
      @user_3 = create(:user)
      @user_4 = create(:user)
      @facade = MovieDetailsFacade.new(75, @user_1.id)
      @movie = @facade.movie
    end

    it 'provides a form to create a new party', :vcr do
      visit "/users/#{@user_1.id}/movies/#{@movie.id}/viewing-party/new"

      expect(page).to have_content("Create a Viewing Party for #{@movie.title}!")
      expect(page).to have_field(:length, with: @movie.runtime)
      fill_in :start_time, with: DateTime.now
      page.check("#{@user_2.id}")
      page.check("#{@user_3.id}")

      click_button("Create Party")
      expect(current_path).to eq("/users/#{@user_1.id}")
    end
  end
end
