require 'rails_helper'

describe "User can view details for one character" do
  scenario "when they click on that character's name on the user show" do
    user = User.create!(username: "CJ", email: "cj@cj.com", password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    character = user.characters.create(player_name: "CJ",
                                        name: "Praxhis",
                                        hit_points: 45,
                                        base_initiative: 12,
                                        race: "Half-Elf",
                                        character_class: "Rogue")

    visit user_character_path(user, character)

    expect(page).to have_content("CJ")
    expect(page).to have_content("Praxhis")
    expect(page).to have_content(45)
    expect(page).to have_content(12)
    expect(page).to have_content("Half-Elf")
    expect(page).to have_content("Rogue")
  end
end
