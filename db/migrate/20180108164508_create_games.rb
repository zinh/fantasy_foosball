class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :match_id
      t.integer :winning_team_id
      t.integer :score

      t.timestamps
    end
  end
end
