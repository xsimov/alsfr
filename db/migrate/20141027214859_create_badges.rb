class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :title
      t.string :difficulty
      t.integer :game_id
      t.timestamps
    end
  end
end
