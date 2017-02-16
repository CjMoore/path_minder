require 'rails_helper'

describe "user can login" do
  it "when they fillout the login form" do
    user = User.create(username: "CJ", email: "cj@cj.com", password: "password")

    visit login_path

    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on "Login"

    expect(current_path).to eq(user)
    expect(page).to have_content("Successfully logged in")
    expect(page).to have_content("Welcome, CJ")
    expect(page).to have_content("Logout")
  end
end
