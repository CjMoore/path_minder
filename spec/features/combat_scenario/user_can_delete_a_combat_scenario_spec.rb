require 'rails_helper'

describe "when on the combat scenario index" do
  xscenario "user can click a button and delete a scenario" do
    user = User.create!(username: "CJ", email: "cj@cj.com", password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    cs1 = user.combat_scenarios.create!(name: "Party Fights Giants")

    visit combat_scenarios_path

    expect(page).to have_content("Party Fights Giants")

    click_on("Delete")

    expect(current_path).to eq(combat_scenarios_path)
    expect(page).to have_content("You have sucessfully deleted a scenario")
    expect(page).to_not have_content("Giants")

  end
end
