class CreateRosters < ActiveRecord::Migration[6.1]
  def change
    create_table :rosters do |t|
      t.string :firstname
      t.string :lastname
      t.string :position
      t.string :status

      t.timestamps
    end
  end
end