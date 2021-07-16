class Api::V1::RostersController < ApplicationController

    def index 
        rosters = Roster.all 
        render json: rosters
    end

    def show 
        roster = Roster.create_roster(params[:id])
        render json: roster
    end
    
end
