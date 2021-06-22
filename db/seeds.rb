# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TEAM_URL = 'https://sportsdata.io/developers/api-documentation/mlb#/base/teams-active'

ROSTER_URL = 'https://sportsdata.io/developers/api-documentation/mlb#/base/players-by-team'

STANDINGS_URL = 'https://sportsdata.io/developers/api-documentation/mlb#/base/standings'

SCORES_URL = 'https://sportsdata.io/developers/api-documentation/mlb#/scores/games-by-date'

NEWS_URL = 'https://sportsdata.io/developers/api-documentation/mlb#/news/news-by-date'

ENV["KEY"]

response = RestClient.get(TEAM_URL)

teams_array = JSON.parse(response)

binding.pry