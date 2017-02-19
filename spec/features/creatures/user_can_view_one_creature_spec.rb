require 'rails_helper'

describe "user can visit show page for one creature" do
  it "and see details for that creature" do
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

    visit combat_scenario_creature_path(cs1, creature)

    expect(page).to have_content("Gorath")
    expect(page).to have_content("Ice Giant")
    expect(page).to have_content("Humanoid")
    expect(page).to have_content("174")
    expect(page).to have_content("14")
    expect(page).to have_content("6")
    expect(page).to have_content("3")
    expect(page).to have_content("Low-light vision, treats intimidate and perception as class skills")
  end
end
