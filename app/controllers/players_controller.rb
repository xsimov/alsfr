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
    @players = Player.all
  end
end
