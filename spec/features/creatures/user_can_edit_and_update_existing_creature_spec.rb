require 'rails_helper'

describe "User can click on edit" do
  it "fill out a form and update an existing creature" do
    user = User.create!(username: "CJ", email: "cj@cj.com", password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    cs1 = user.combat_scenarios.create!(name: "Party Fights Giants")

    creature = cs1.creatures.create(name: "Gorath",
                                    creature_name: "Ice Giant",
                                    creature_type: "Humanoid",
                                    hit_points: 174,
                                    will_save: 14,
                                    reflex_save: 6,
                                    fortitude_save: 3,
                                    base_initiative: -1,
                                    perception: 10,
                                    traits: "Low-light vision, treats intimidate and perception as class skills" )

    visit edit_combat_scenario_creature_path(cs1, creature)

    fill_in 'creature[name]', :with => "Taco"
    fill_in 'creature[creature_name]', :with => "Elder Giant"
    fill_in 'creature[will_save]', :with => 12
    fill_in 'creature[reflex_save]', :with => 8
    fill_in 'creature[fortitude_save]', :with => 4
    fill_in 'creature[perception]', :with => 9
    fill_in 'creature[base_initiative]', :with => 1
    fill_in 'creature[creature_type]', :with => "Humanoid"
    fill_in 'creature[hit_points]', :with => 169
    fill_in 'creature[traits]', :with => "Low light vision, treats intimidate and perception as class skills"

    click_on "Update Creature"

    expect(page).to have_content("Taco")
    expect(page).to have_content("Elder Giant")
    expect(page).to have_content(12)
    expect(page).to have_content(8)
    expect(page).to have_content(4)
    expect(page).to have_content(9)
    expect(page).to have_content(1)
    expect(page).to have_content(169)

  end
end
