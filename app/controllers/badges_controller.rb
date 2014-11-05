class BadgesController < ApplicationController

  before_filter :find_game

  def new
    @badge = Badge.new
  end

  def create
    Badge.save badge_params.merge(game_id: @game.id)
  rescue
    render :new
  end

  def assign_badge
    player = Player.find params[:id]
  end

  private
  def badge_params
    params.require(:badge).permit(:title, :points, :game_id)
  end

  def find_game
    @game = Game.find params[:game_id]
  end
end
