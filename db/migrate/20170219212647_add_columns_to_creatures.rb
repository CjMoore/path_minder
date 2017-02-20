class AddColumnsToCreatures < ActiveRecord::Migration[5.0]
  def change
    add_column :creatures, :will_save, :integer
    add_column :creatures, :fortitude_save, :integer
    add_column :creatures, :reflex_save, :integer
    add_column :creatures, :alive, :boolean, default: true
    add_column :creatures, :perception, :integer
    add_column :creatures, :base_initiative, :integer
  end
end
