class Roster < ApplicationRecord
   validates :player_id, uniqueness: true

   scope :create_roster, ->(team) { where("team == ?", team)}
end
