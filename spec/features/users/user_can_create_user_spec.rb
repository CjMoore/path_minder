require 'rails_helper'

describe "user can fill out a form" do
  it "and create an account" do
    visit(new_user_path)

    fill_in 'user[username]', :with => "CJ"
    fill_in 'user[email]', :with => "CJ@email.com"
    fill_in 'user[password]', :with => "password"
    fill_in 'user[password_confirmation]', :with => "password"
    click_on "Create Account"

    expect(current_path).to eq(combat_scenarios_path)
    expect(page).to have_content("Successfully created new user")
    # expect(page).to have_content("Welcome, CJ")
  end
end
