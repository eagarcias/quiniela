class Match < ApplicationRecord
    validates :first_team_id, presence: true
    validates :second_team_id, presence: true
    validates :date, presence: true
    enum status: {
        initiated: :initiated,
        finished: :finished,
    }
    has_one :first_team_id, class_name: "Team", foreign_key: "first_team_id"
    has_one :second_team_id, class_name: "Team", foreign_key: "second_team_id"
    has_one :winner_team_id, class_name: "Team", foreign_key: "winner_team_id"

    def winner_team_id
        if (first_team_goals)
    end
end
