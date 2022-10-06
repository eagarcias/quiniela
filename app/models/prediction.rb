class Prediction < ApplicationRecord
    belongs_to :match 
    belongs_to :user 

    has_one :first_team, through: :match
    has_one :second_team, through: :match

    def points 
        if (first_team_goals == match.first_team_goals && second_team_goals == match.second_team_goals)
            3
        elsif (first_team_goals == match.first_team_goals || second_team_goals == match.second_team_goals)
            2
        else
            0    
        end
    end
end
