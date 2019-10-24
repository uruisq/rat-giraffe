class CreateCases < ActiveRecord::Migration[5.0]
  def change
    create_table :cases do |t|
      t.string :title
      t.integer :charge
      t.string :address
      t.integer :age
      t.text :memo

      t.timestamps
    end
  end
end
