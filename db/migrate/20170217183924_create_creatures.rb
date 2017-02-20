class CreateCreatures < ActiveRecord::Migration[5.0]
  def change
    create_table :creatures do |t|
      t.string :name
      t.string :creature_name
      t.integer :count
      t.string :creature_type
      t.integer :hit_points
      t.string :traits
      t.integer :initiative, default: 0
      t.references :combat_scenario, foreign_key: true

      t.timestamps
    end
  end
end
