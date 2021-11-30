require 'rails_helper'

RSpec.describe 'Landing Page' do
  describe 'when a user visits the landing page' do
    before :each do
      @user_1 = create(:user)
      @user_2 = create(:user)
      visit root_path
    end

    it 'has a title' do
      within("#header") do
        expect(page).to have_content("Viewing Party Light")
      end
    end

    it 'has a button to create a new user' do
      within("#create_user") do
        expect(page).to have_button("Create New User")
      end
    end

    it 'has a list of exisiting users' do
      within("#user-#{@user_1.id}") do
        expect(page).to have_link(@user_1.email)
      end
      within("#user-#{@user_2.id}") do
        expect(page).to have_link(@user_2.email)
      end
    end

    it 'has a link back to the home page' do
      expect(page).to have_link("Home")

      click_link("Home")

      expect(current_path).to eq(root_path)
    end
  end
end
