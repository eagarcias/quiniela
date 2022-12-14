class MatchesController < ApplicationController
    before_action :set_match, only: %i[ show edit update destroy ]
    
    # GET /matches or /matches.json
    def index
        @matches = Match.all
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
        
        if(@match.first_team.id == @match.second_team_id)
            flash.now[:alert] = "Los equipos no pueden ser los mismos"
            respond_to do |format|
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @match.errors, status: :unprocessable_entity }
            end
            return
        end 
        
        respond_to do |format|
            
            if @match.save
                format.html { redirect_to matches_url, notice: "Match was successfully created." }
                format.json { render :show, status: :created, location: @match }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @match.errors, status: :unprocessable_entity }
            end
        end
    end
    
    # PATCH/PUT /matches/1 or /matches/1.json
    def update

        if(match_params[:first_team_id] == match_params[:second_team_id])
            flash.now[:alert] = "Los equipos no pueden ser los mismos"
            respond_to do |format|
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @match.errors, status: :unprocessable_entity }
            end
            return
        end 
        respond_to do |format|
            if @match.update(match_params)
                format.html { redirect_to matches_url, notice: "Match was successfully updated." }
                format.json { render :show, status: :ok, location: @match }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @match.errors, status: :unprocessable_entity }
            end
        end
    end
    
    # DELETE /matches/1 or /matches/1.json
    def destroy
        @match.destroy
        
        respond_to do |format|
            format.html { redirect_to matches_url, notice: "Match was successfully destroyed." }
            format.json { head :no_content }
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
