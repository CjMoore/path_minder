require 'rails_helper'

RSpec.describe Creature, type: :model do
  describe "relationships" do
    it "belongs_to a combat_scenario" do
      user = User.create(username: "CJ", email: "cj@cj.com", password: "password")
      cs = user.combat_scenarios.create(name: "Party Fights Skeletons")
      creature = cs.creatures.create(name: "Gorath", creature_name: "Frost Giant")
      expect(creature).to respond_to(:combat_scenario)
    end
  end
end
