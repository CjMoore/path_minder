class CombatScenario < ApplicationRecord
  belongs_to :user
  has_many :creatures

  validates :name, presence: true
end
