class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.bigint :first_team_id
      t.bigint :second_team_id
      
      t.datetime :date
      t.string :status
      t.bigint :winner_team_id
      t.integer :first_team_goals, default: 0
      t.integer :second_team_goals, default: 0
      t.timestamps
    end
    add_foreign_key :matches, :teams, column: :first_team_id
    add_foreign_key :matches, :teams, column: :second_team_id
    add_foreign_key :matches, :teams, column: :winner_team_id
  end
end
