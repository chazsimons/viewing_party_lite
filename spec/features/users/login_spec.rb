RSpec.describe "Logging In" do
  it "can log in with valid credentials" do
    user = create(:user)

    visit '/'

    click_link "Log In"

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_button "Log In"

    expect(current_path).to eq("/dashboard")

    expect(page).to have_content("Welcome back #{user.name}")
    expect(page).to have_content("#{user.name}'s Dashboard")
  end

  it "returns an error when logging in with invalid credentials" do
    user = create(:user)

    visit '/'

    click_link "Log In"

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: 'test123'

    click_button "Log In"

    expect(current_path).to eq("/login")

    expect(page).to have_content("Sorry, your password didn't match")
  end
end
