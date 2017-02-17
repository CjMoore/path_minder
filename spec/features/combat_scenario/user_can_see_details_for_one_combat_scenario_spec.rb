require 'rails_helper'

describe "when user clicks link to individual combat scenario" do
  it "they see all creatures in that combat scenario" do
    user = User.create(username: "CJ", email: "cj@cj.com", password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    cs1 = user.combat_scenarios.create(name: "Party Fights Skeletons")

    visit edit_combat_scenario_path(cs1)

    fill_in 'combat_scenario[name]', :with => "Party Fights Giants"
    click_on "Update Combat Scenario"

    expect(current_path).to eq(combat_scenario_path(cs1))
    expect(page).to have_content("Party Fights Giants")
  end
end
