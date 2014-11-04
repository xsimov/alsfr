class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :match_id
      t.integer :player_id
      t.integer :points, default: 0
      t.timestamps
    end
  end
end
