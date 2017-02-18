require 'rails_helper'

describe "user can login" do
  it "when they fillout the login form" do
    user = User.create(username: "CJ", email: "cj@cj.com", password: "password")

    visit login_path

    fill_in 'session[email]', with: "cj@cj.com"
    fill_in 'session[password]', with: "password"
    click_on "Login"

    # save_and_open_page

    expect(current_path).to eq(combat_scenarios_path)
    expect(page).to have_content("Successfully logged in")
    # expect(page).to have_content("Welcome, CJ")
    expect(page).to have_content("Logout")
  end
end
