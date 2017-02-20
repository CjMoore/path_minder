class Character < ApplicationRecord
  belongs_to :user

  has_many :combat_scenario_characters, dependent: :destroy
  has_many :combat_scenarios, through: :combat_scenario_characters, dependent: :destroy
end
