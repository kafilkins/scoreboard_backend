class Team < ApplicationRecord
   # has_many :rosters 

    validates :key, uniqueness: true
end
