class Roster < ApplicationRecord
   # belongs_to :team 
   validates :player_id, uniqueness: true
end
