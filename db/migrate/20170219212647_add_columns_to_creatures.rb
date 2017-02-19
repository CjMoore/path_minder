class AddColumnsToCreatures < ActiveRecord::Migration[5.0]
  def change
    add_column :creatures, :will_save, :integer
    add_column :creatures, :fortitude_save, :integer
    add_column :creatures, :reflex_save, :integer
    add_column :creatures, :alive, :boolean, default: true
  end
end
