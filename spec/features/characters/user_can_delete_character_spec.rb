require 'rails_helper'

describe "user can click delete" do
  xscenario "and character will be removed from characters" do
    user = User.create!(username: "CJ", email: "cj@cj.com", password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    character = user.characters.create(player_name: "CJ",
                                        name: "Praxhis",
                                        hit_points: 45,
                                        base_initiative: 12,
                                        race: "Half-Elf",
                                        character_class: "Rogue")

    visit user_character_path(user, character)

    click_on "Delete"

    expect(current_path).to eq(combat_scenarios_path)

    expect(page).to_not have_content("CJ")
  end
end
