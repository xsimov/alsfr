class CreateJoinTableBadgesPlayers < ActiveRecord::Migration
  def change
    create_join_table :badges, :players do |t|
      t.index :badge_id
      t.index :player_id
    end
  end
end
