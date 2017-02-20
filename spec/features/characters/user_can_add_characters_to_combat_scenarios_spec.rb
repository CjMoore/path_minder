require 'rails_helper'

describe "user can add existing character" do
  scenario "to combat_scenarios" do
    user = User.create!(username: "CJ", email: "cj@cj.com", password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    character = user.characters.create(player_name: "CJ",
                                        name: "Praxhis",
                                        hit_points: 45,
                                        base_initiative: 12,
                                        race: "Half-Elf",
                                        character_class: "Rogue")

    character2 = user.characters.create(player_name: "Matt",
                                        name: "Magpie",
                                        hit_points: 95,
                                        base_initiative: 6,
                                        race: "Half-Orc",
                                        character_class: "Barbarian")




    cs1 = user.combat_scenarios.create!(name: "Party Fights Giants")
    visit combat_scenario_path(cs1)

    click_on ("Add Character To Scenario")

    select("Praxhis", from: 'combat_scenario[character_ids][]')
    select("Magpie", from: 'combat_scenario[character_ids][]')

    click_on "Add Characters"

    expect(current_path).to eq(combat_scenario_path(cs1))
    expect(page).to have_link("Praxhis")
    expect(page).to have_link("Magpie")

  end
end
