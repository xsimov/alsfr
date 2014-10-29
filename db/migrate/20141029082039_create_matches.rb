class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :duration
      t.integer :game_id
      t.timestamps
    end
  end
end
