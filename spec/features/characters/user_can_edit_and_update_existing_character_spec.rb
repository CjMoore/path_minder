require 'rails_helper'

describe "user can edit and update" do
  scenario "existing character" do
    user = User.create!(username: "CJ", email: "cj@cj.com", password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    character = user.characters.create(player_name: "CJ",
                                        name: "Praxhis",
                                        hit_points: 45,
                                        base_initiative: 12,
                                        race: "Half-Elf",
                                        character_class: "Rogue")

    visit user_character_path(user, character)

    click_on "Edit Character"
    expect(current_path).to eq(edit_user_character_path(user, character))

    fill_in 'character[player_name]', :with => "Charlotte"
    fill_in 'character[name]', :with => "Thana"
    fill_in 'character[hit_points]', :with => 60
    fill_in 'character[base_initiative]', :with => 14
    fill_in 'character[race]', :with => "Elf"
    fill_in 'character[character_class]', :with => "Wizard"

    click_on "Update Character"

    expect(current_path).to eq(user_character_path(user, character))

    expect(page).to have_content("Charlotte")
    expect(page).to have_content("Thana")
    expect(page).to have_content(60)
    expect(page).to have_content(14)
    expect(page).to have_content("Elf")
    expect(page).to have_content("Wizard")
  end
end
