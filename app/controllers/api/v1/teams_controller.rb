class Api::V1::TeamsController < ApplicationController

    def index 
        teams = Team.all 
        render json: teams
    end

    def show 

    end

end
