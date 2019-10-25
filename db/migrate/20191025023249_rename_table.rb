class RenameTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :cases, :buildings
  end
end
