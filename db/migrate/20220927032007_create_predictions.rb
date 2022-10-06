class CreatePredictions < ActiveRecord::Migration[7.0]
  def change
    create_table :predictions do |t|
      t.integer :first_team_goals
      t.integer :second_team_goals
      t.timestamps
    end
    
    add_reference :predictions, :match, foreign_key: true
    add_reference :predictions, :user, foreign_key: true
  end
end
