class Team < ApplicationRecord
    validates :name, presence: true

    has_many :matches_first_team, class_name: 'Match', foreign_key: 'first_team_id'
    has_many :matches_second_team, class_name: 'Match', foreign_key: 'second_team_id'

    def matches 
        (matches_first_team + matches_second_team)
    end
end
