class GamesController < ApplicationController
  def index
    @games = Game.order(:id)
  end

  def show
    @game = Game.find params[:id]
  end

  def new
    @game = Game.new
  end

  def edit
    @game = Game.find params[:id]
  end

  def update
    @game = Game.find params[:id]
    @game.update game_params
    redirect_to games_path
  rescue
    render :edit
  end

  def create
    @game = Game.create game_params
    flash[:notice] = "Joc afegit!"
    redirect_to games_path
  rescue
    render :new
  end

  def game_params
    params.require(:game).permit(:title, :game_type)
  end
end
