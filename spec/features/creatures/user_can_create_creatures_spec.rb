require 'rails_helper'

describe "on combat scenario show user can click a button" do
  scenario "and fill out a form to create a creature" do
    user = User.create!(username: "CJ", email: "cj@cj.com", password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    cs1 = user.combat_scenarios.create!(name: "Party Fights Giants")
    visit combat_scenario_path(cs1)

    click_on("Add Creature")

    expect(current_path).to eq(new_combat_scenario_creature_path(cs1))

    fill_in 'creature[name]', :with => "Gorath"
    fill_in 'creature[creature_name]', :with => "Frost Giant"
    fill_in 'creature[will_save]', :with => 14
    fill_in 'creature[reflex_save]', :with => 6
    fill_in 'creature[fortitude_save]', :with => 3
    fill_in 'creature[perception]', :with => 10
    fill_in 'creature[base_initiative]', :with => -1
    fill_in 'creature[creature_type]', :with => "Humanoid"
    fill_in 'creature[hit_points]', :with => 174
    fill_in 'creature[traits]', :with => "Low light vision, treats intimidate and perception as class skills"

    click_on "Create Creature"

    expect(page).to have_content("Gorath")
  end
end
