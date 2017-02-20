require 'rails_helper'

RSpec.describe Character, type: :model do
  describe "relationships" do
    it "has many combat_scenarios" do
      user = User.create(username: "CJ", email: "cj@cj.com", password: "password")
      cs = user.combat_scenarios.create(name: "Party Fights Skeletons")
      character = user.characters.create(player_name: "CJ",
                                          name: "Praxhis",
                                          hit_points: 45,
                                          base_initiative: 12,
                                          race: "Half-Elf",
                                          character_class: "Rogue")

      expect(character).to respond_to(:combat_scenarios)
    end
  end
end
