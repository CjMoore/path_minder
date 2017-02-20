require 'rails_helper'

describe "User can click button" do
  it 'and delete existing creature' do
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


    click_on("Delete")

    expect(current_path).to eq(combat_scenario_path(cs1))
    expect(page).to_not have_content("Gorath")
  end
end
