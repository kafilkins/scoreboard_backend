class AddStatusDatetimeToScores < ActiveRecord::Migration[6.1]
  def change
    add_column :scores, :status, :string
    add_column :scores, :datetime, :string
  end
end
