class Api::V1::RostersController < ApplicationController

    def index 
        rosters = Roster.all 
        render json: rosters
    end

    def show 
        roster = Roster.create_roster(rosters_params)
        render json: roster
    end

    private 

    def rosters_params
        params.require(:rosters).permit(:team)
    end

end
