class PlayersController < ApplicationController
  def new
    @player = Player.new
  end

  def create
    Player.create player_params
    redirect_to root_path
  end

  def show
    @player = Player.find(params[:id])
  end

  def index
    unsorted_players = Player.all
    @players = unsorted_players.sort_by { |player| player.total_points }.reverse
  end

  def destroy
    player = Player.find params[:id]
    player.destroy
    redirect_to root_path
  end

  def player_params
    params.require(:player).permit(:name)
  end
end
