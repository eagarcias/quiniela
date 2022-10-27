require_relative "./application_api_controller"
class Api::V1::MatchesController < ApplicationApiController
    before_action :authentication

    # GET /matches/test
    def test
        render json: { message: "Hola mundo" } 
        # puts 'hola mundo'
    end
    
    # GET /matches or /matches.json
    def index
        @matches = Match.all
        render json: @matches
    end
    
    # GET /matches/1 or /matches/1.json
    def show
    end
    
    # GET /matches/new
    def new
        @match = Match.new
    end
    
    # GET /matches/1/edit
    def edit
    end
    
    # POST /matches or /matches.json
    def create
        @match = Match.new(match_params)
        if(@match.first_team_id == @match.second_team_id)
            respond_to do |format|
                format.json { render json: @match.errors, status: :unprocessable_entity }
            end
            return
        end 
        
        respond_to do |format|
            
            if @match.save
                format.json { render json: @match, status: :created}
            else
                format.json { render json: @match.errors, status: :unprocessable_entity }
            end
        end
    end
    
    # PATCH/PUT /matches/1 or /matches/1.json
    def update

        if(match_params[:first_team_id] == match_params[:second_team_id])
           
            respond_to do |format|
                format.json { render json: @match.errors, status: :unprocessable_entity }
            end
            return
        end 
        respond_to do |format|
            if @match.update(match_params)
                format.json { render json: @match}
            else
                format.json { render json: @match.errors, status: :unprocessable_entity }
            end
        end
    end
    
    # DELETE /matches/1 or /matches/1.json
    def destroy
        @match.destroy
        
        respond_to do |format|
            format.json { render json: {message: "Succesful deleted"} }
        end
    end
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
        @match = Match.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def match_params
        
        params.fetch(:match, {}).permit(
        :first_team_id,
        :second_team_id,
        :first_team_goals,
        :second_team_goals,
        :date
        )
    end

end
