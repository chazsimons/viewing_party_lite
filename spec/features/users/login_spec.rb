RSpec.describe "Logging In" do
  it "can log in with valid credentials" do
    user = create(:user)

    visit '/'

    click_link "Log In"

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_button "Log In"

    expect(current_path).to eq("/users/#{user.id}")

    expect(page).to have_content("Welcome back #{user.name}")
    expect(page).to have_content("#{user.name}'s Dashboard")
  end
end
