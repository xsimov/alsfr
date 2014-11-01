class MatchesController < ApplicationController
  def new
    @match = Match.new
    @game = Game.find params[:game_id]
    @players = Player.all
  end

  def create
    match = Match.new game_id: params[:game_id]
    params[:match][:players].each do |player_id|
      match.players << Player.find(player_id)
    end
    match.save
    redirect_to games_path
  end

end
