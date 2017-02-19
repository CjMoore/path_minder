require 'rails_helper'

describe 'user can fill out a form and' do
  scenario 'add a new character to a combat scenario' do
    user = User.create!(username: "CJ", email: "cj@cj.com", password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    cs1 = user.combat_scenarios.create!(name: "Party Fights Giants")
    visit combat_scenarios_path

    click_on "Add Character"

    expect(current_path).to eq(new_user_character_path(user))

    fill_in 'character[player_name]', :with => "CJ"
    fill_in 'character[name]', :with => "Praxhis"
    fill_in 'character[hit_points]', :with => 45
    fill_in 'character[base_initiative]', :with => 12
    fill_in 'character[race]', :with => "Half-Elf"
    fill_in 'character[character_class]', :with => "Rogue"

    click_on "Create Character"

    expect(current_path).to eq(combat_scenarios_path)

    expect(page).to have_content("You've successfully created a new character")
    expect(page).to have_content("Praxhis")
    expect(page).to have_content("CJ")
    expect(page).to have_content("Half-Elf")
    expect(page).to have_content("Rogue")
    expect(page).to have_content("45")

  end
end
