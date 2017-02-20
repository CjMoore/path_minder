require 'rails_helper'

describe "when user fills out form" do
  scenario "they are able to create a new combat scenario" do
    user = User.create(username: "CJ", email: "cj@cj.com", password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_combat_scenario_path

    fill_in 'combat_scenario[name]', :with => "Players Fight Skeletons"
    click_on "Create Combat Scenario"

    # byebug
    expect(current_path).to eq(combat_scenarios_path)

    expect(page).to have_link("Players Fight Skeletons")
    expect(page).to have_link("Create Combat Scenario")

  end
end
