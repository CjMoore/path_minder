class CreateCombatScenarioCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :combat_scenario_characters do |t|
      t.references :character, foreign_key: true
      t.references :combat_scenario, foreign_key: true

      t.timestamps
    end
  end
end
