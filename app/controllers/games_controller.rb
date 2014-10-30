class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create game_params
    flash[:notice] = "Joc afegit!"
    redirect_to games_path
  rescue
    render :new
  end
end
