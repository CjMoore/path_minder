class CombatScenario < ApplicationRecord
  belongs_to :user
  has_many :creatures

  has_many :combat_scenario_characters, dependent: :destroy
  has_many :characters, through: :combat_scenario_characters, dependent: :destroy

  validates :name, presence: true
end
