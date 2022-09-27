class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.bigint :first_team_id
      t.bigint :second_team_id
      t.datetime :date
      t.string :state
      t.bigint :winner_team_id
      t.bigint :first_team_goals
      t.bigint :second_team_goals
      t.timestamps
    end
    add_foreign_key :matches, :teams, column: :first_team_id
    add_foreign_key :matches, :teams, column: :second_team_id
  end
end
