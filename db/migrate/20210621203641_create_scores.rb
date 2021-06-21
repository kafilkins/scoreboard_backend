class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.date :day
      t.string :awayteam
      t.string :hometeam
      t.integer :awayteamruns
      t.integer :hometeamruns

      t.timestamps
    end
  end
end
