# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ENV["KEY"]

TEAM_URL = "https://fly.sportsdata.io/v3/mlb/scores/json/teams?key=#{ENV["KEY"]}"

ROSTER_URL = "https://fly.sportsdata.io/v3/mlb/scores/json/Players?key=#{ENV["KEY"]}"

STANDINGS_URL = 'https://sportsdata.io/developers/api-documentation/mlb#/base/standings'

SCORES_URL = 'https://sportsdata.io/developers/api-documentation/mlb#/scores/games-by-date'

NEWS_URL = 'https://sportsdata.io/developers/api-documentation/mlb#/news/news-by-date'

team_response = RestClient.get(TEAM_URL)
teams_array = JSON.parse(team_response)
teams_array.map do |team|
    Team.create(key: team["Key"], 
        city: team["City"], 
        name: team["Name"], 
        league: team["League"], 
        division: team["Division"], 
        logo: team["WikipediaLogoUrl"])
end

roster_response = RestClient.get(ROSTER_URL)
rosters_array = JSON.parse(roster_response)
rosters_array.map do |player|
    #team = Team.find_by(key: player["Team"])
    if player["Status"] == "Active"
    Roster.create(firstname: player["FirstName"],
        lastname: player["LastName"],
        position: player["Position"],
        status: player["Status"],
        team: player["Team"]
    )
    end
end
