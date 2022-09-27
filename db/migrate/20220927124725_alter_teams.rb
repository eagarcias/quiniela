class AlterTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :games_won, :integer
  end
end
