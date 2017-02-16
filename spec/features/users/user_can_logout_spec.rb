require 'rails_helper'

describe "logged in user can" do
  it "logout" do
    user = User.create(username: "CJ", email: "cj@cj.com", password: "password")

    visit login_path

    fill_in 'session[email]', with: "cj@cj.com"
    fill_in 'session[password]', with: "password"
    click_on "Login"

    expect(current_path).to eq(user_path(user))

    click_on "Logout"


    expect(page).to have_content("Successfully logged out")
  end
end
