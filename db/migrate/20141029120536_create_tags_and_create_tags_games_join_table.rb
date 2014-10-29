class CreateTagsAndCreateTagsGamesJoinTable < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :label
    end

    create_join_table :games, :tags do |t|
      t.index :game_id
      t.index :tag_id
    end
  end
end
