class CreatePredictions < ActiveRecord::Migration[7.0]
  def change
    create_table :predictions do |t|
      t.bigint :winner_team_id
      t.bigint :loser_team_id
      t.bigint :winner_team_goals
      t.bigint :loser_team_goals
      t.timestamps
    end
    add_foreign_key :predictions, :teams, column: :winner_team_id
    add_foreign_key :predictions, :teams, column: :loser_team_id
    add_reference :predictions, :match, foreign_key: true
    add_reference :predictions, :user, foreign_key: true
  end
end
