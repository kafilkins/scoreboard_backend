class Roster < ApplicationRecord
   validates :player_id, uniqueness: true
end
