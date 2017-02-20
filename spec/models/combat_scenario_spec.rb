require 'rails_helper'

RSpec.describe CombatScenario, type: :model do
  describe "relationships" do
    it "belongs to a user" do
      user = User.create(username: "CJ", email: "cj@cj.com", password: "password")
      cs = user.combat_scenarios.create(name: "Party Fights Skeletons")
      expect(cs).to respond_to(:user)
    end

    it "has many characters" do
      user = User.create(username: "CJ", email: "cj@cj.com", password: "password")
      cs = user.combat_scenarios.create(name: "Party Fights Skeletons")
      expect(cs).to respond_to(:characters)
    end

    it "has many creatures" do
      user = User.create(username: "CJ", email: "cj@cj.com", password: "password")
      cs = user.combat_scenarios.create(name: "Party Fights Skeletons")
      expect(cs).to respond_to(:creatures)
    end
  end

  describe "validations" do
    context "with valid attributes" do
      it "is valid" do
        user = User.create(username: "CJ", email: "cj@cj.com", password: "password")
        cs = user.combat_scenarios.create(name: "Party Fights Skeletons")
        expect(cs).to be_valid
      end
    end

    context "with invalid attributes" do
      it "is invalid without a name" do
        user = User.create(username: "CJ", email: "cj@cj.com", password: "password")
        cs = user.combat_scenarios.create()
        expect(cs).to be_invalid
      end
    end
  end
end
