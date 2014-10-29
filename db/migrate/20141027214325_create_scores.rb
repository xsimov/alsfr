class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :match_id
      t.integer :player_id
      t.integer :points
      t.timestamps
    end
  end
end
