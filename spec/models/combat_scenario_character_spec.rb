require 'rails_helper'

RSpec.describe CombatScenarioCharacter, type: :model do
  describe "relationships" do
    it "belongs to a combat_scenario and character" do
      user = User.create(username: "CJ", email: "cj@cj.com", password: "password")
      cs = user.combat_scenarios.create(name: "Party Fights Skeletons")
      character = user.characters.create(player_name: "CJ",
                                          name: "Praxhis",
                                          hit_points: 45,
                                          base_initiative: 12,
                                          race: "Half-Elf",
                                          character_class: "Rogue")
      csc = CombatScenarioCharacter.new(combat_scenario_id: cs.id, character_id: character.id)
      expect(csc).to respond_to(:character)
      expect(csc).to respond_to(:combat_scenario)
    end
  end
end
