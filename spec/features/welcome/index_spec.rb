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


    it 'has a link back to the home page' do
      expect(page).to have_link("Home")

      click_link("Home")

      expect(current_path).to eq(root_path)
    end

    it 'has a link to log in as a user' do
      expect(page).to have_link("Log In")

      click_link("Log In")

      expect(current_path).to eq("/login")
    end
  end

  describe 'as a user' do
    before :each do
      @user_1 = create(:user)
      @user_2 = create(:user)
      visit '/login'
      fill_in :email , with: @user_1.email
      fill_in :password, with: @user_1.password
      click_button "Log In"
      visit root_path
    end

    it 'has a list of exisiting users' do
      within("#user-#{@user_1.id}") do
        expect(page).to have_content("#{@user_1.email}")
      end
      within("#user-#{@user_2.id}") do
        expect(page).to have_content("#{@user_2.email}")
      end
    end

    it 'has a link to logout' do
      expect(page).to have_content("#{@user_1.email}")

      click_link("Log Out")
      expect(current_path).to eq(root_path)
      expect(page).to_not have_content("#{@user_1.email}")
    end
  end
end
