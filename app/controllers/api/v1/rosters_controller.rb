class Api::V1::RostersController < ApplicationController

    def index 
        roster = Roster.all 
        render json: roster  
    end

    def show 

    end

end
