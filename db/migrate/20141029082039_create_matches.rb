class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :duration, default: 0
      t.integer :game_id
      t.boolean :open_status, default: true
      t.timestamps
    end
  end
end
