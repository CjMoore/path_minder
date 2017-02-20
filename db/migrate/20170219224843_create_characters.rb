class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :player_name
      t.string :name
      t.integer :hit_points
      t.integer :base_initiative
      t.string :race
      t.string :class
      

      t.timestamps
    end
  end
end
