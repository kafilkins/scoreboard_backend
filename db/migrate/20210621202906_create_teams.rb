class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :key
      t.string :city
      t.string :name
      t.string :league
      t.string :division
      t.string :logo

      t.timestamps
    end
  end
end
