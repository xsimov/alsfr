class AddLocationAndOwnerToGames < ActiveRecord::Migration
  def change
    add_column :games, :location, :string
    add_column :games, :owner, :string
    add_column :games, :expansions, :string, array:true, default: []
  end
end
