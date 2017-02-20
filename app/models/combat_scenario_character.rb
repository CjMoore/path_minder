class CombatScenarioCharacter < ApplicationRecord
  belongs_to :character
  belongs_to :combat_scenario
end
