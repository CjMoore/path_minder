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

    cs1 = user.combat_scenarios.create!(name: "Party Fights Giants")
    visit combat_scenario_path(cs1)

    click_on ("Add Character To Scenario")

    select("Praxhis", from: '')
  end
end
