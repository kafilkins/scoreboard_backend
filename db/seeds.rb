# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ENV["KEY"]
current_date = Date.today.to_s(:custom)

TEAM_URL = "https://fly.sportsdata.io/v3/mlb/scores/json/teams?key=#{ENV["KEY"]}"

ROSTER_URL = "https://fly.sportsdata.io/v3/mlb/scores/json/Players?key=#{ENV["KEY"]}"

STANDINGS_URL = "https://fly.sportsdata.io/v3/mlb/scores/json/Standings/2021?key=#{ENV["KEY"]}"

SCORES_URL = "https://fly.sportsdata.io/v3/mlb/scores/json/GamesByDate/#{current_date}?key=#{ENV["KEY"]}"

NEWS_URL = "https://fly.sportsdata.io/v3/mlb/scores/json/NewsByDate/#{current_date}?key=#{ENV["KEY"]}"

scores_response = RestClient.get(SCORES_URL)
scores_array = JSON.parse(scores_response)
scores_array.map do |score|
    Score.create(day: score["Day"],
        awayteam: score["AwayTeam"],
        hometeam: score["HomeTeam"],
        awayteamruns: score["AwayTeamRuns"],
        hometeamruns: score["HomeTeamRuns"]
        )
end

standings_response = RestClient.get(STANDINGS_URL)
standings_array = JSON.parse(standings_response)
standings_array.map do |standing|
    Standing.create(city: standing["City"],
        name: standing["Name"],
        league: standing["League"],
        division: standing["Division"],
        wins: standing["Wins"],
        losses: standing["Losses"]
        )
end

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
    if player["Status"] == "Active"
    Roster.create(firstname: player["FirstName"],
        lastname: player["LastName"],
        position: player["Position"],
        status: player["Status"],
        team: player["Team"],
        player_id: player["PlayerID"]
    )
    end
end

news_response = RestClient.get(NEWS_URL)
news_array = JSON.parse(news_response)
news_array.map do |news|
    News.create(title: news["Title"],
        content: news["Content"]
        )
end