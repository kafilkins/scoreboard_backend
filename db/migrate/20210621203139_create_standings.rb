class CreateStandings < ActiveRecord::Migration[6.1]
  def change
    create_table :standings do |t|
      t.string :city
      t.string :name
      t.string :league
      t.string :division
      t.integer :wins
      t.integer :losses

      t.timestamps
    end
  end
end
