class Prediction < ApplicationRecord
    validates :winner_team_id, presence: true
    validates :loser_team_id, presence: true
    validates :winner_team_goals, presence: true
    validates :loser_team_goals, presence: true
    has_one :winner_team_id, class_name: "Team", foreign_key: true
    has_one :loser_team_id, class_name: "Team", foreign_key: true
end
