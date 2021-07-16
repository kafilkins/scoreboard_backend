class Score < ApplicationRecord

    scope :todays_scores, ->(score) { where("day == ?", score)}
end
