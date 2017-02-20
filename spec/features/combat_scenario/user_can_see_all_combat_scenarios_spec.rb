require 'rails_helper'

describe "when user visits combat index" do
  it "they see all of their owned combat_scenarios" do
    user = User.create(username: "CJ", email: "cj@cj.com", password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    cs1 = user.combat_scenarios.create(name: "Party Fights Skeletons")
    cs2 = user.combat_scenarios.create(name: "Party Fights Zombies in Forrest of Doom")

    visit combat_scenarios_path

    expect(page).to have_content("Party Fights Skeletons")
    expect(page).to have_content("Party Fights Zombies in Forrest of Doom")
  end

  it "they do not see combat scenarios owned by other users" do
    user = User.create(username: "CJ", email: "cj@cj.com", password: "password")
    user2 = User.create(username: "other", email: "other@other.com", password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    cs1 = user.combat_scenarios.create(name: "Party Fights Skeletons")
    cs2 = user2.combat_scenarios.create(name: "Party Fights Zombies in Forrest of Doom")

    visit combat_scenarios_path

    expect(page).to have_content("Party Fights Skeletons")
    expect(page).to_not have_content("Party Fights Zombies in Forrest of Doom")
  end
end
