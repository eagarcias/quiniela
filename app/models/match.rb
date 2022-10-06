class Match < ApplicationRecord    
    validates :date, presence: true
    enum status: {
        initiated: :initiated,
        finished: :finished,
    }

    belongs_to :first_team, class_name: "Team", foreign_key: "first_team_id"
    belongs_to :second_team, class_name: "Team", foreign_key: "second_team_id"

    has_many :predictions
    
    def winner_team
        if (first_team_goals > second_team_goals)
            "El ganador es: #{first_team.name}"
        elsif (second_team_goals > first_team_goals)
            "El ganador es: #{second_team.name}" 
        else
            "Empates"
        end
    end
end
