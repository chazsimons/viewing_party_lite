require 'rails_helper'

RSpec.describe 'User Dashboard' do
  describe 'when a user visits their dashboard' do
    before :each do
      @user_1 = create(:user)
      @user_2 = create(:user)
      visit "/users/#{@user_1.id}"
    end

    it 'has their name' do
      expect(page).to have_content("#{@user_1.name}'s Dashboard")
      expect(page).to_not have_content(@user_2.name)
    end

    it 'has a link to descover movies' do
      click_button 'Discover Movies'

      expect(current_path).to eq "/users/#{@user_1.id}/discover"
    end
  end
end
