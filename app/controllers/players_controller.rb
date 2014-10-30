class PlayersController < ApplicationController
  def new
  end

  def create
    Player.save name: params[:name]
  end

  def show
    @player = Player.find(params[:id])
  end

  def index
    unsorted_players = Player.all
    @players = unsorted_players.sort_by { |player| player.total_points }.reverse
  end
end
