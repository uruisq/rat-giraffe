class RenameTablePlus < ActiveRecord::Migration[5.0]
  def change
    rename_column :stations, :case_id, :building_id
  end
end
