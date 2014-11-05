class MatchesController < ApplicationController

  before_filter :find_game, only: [:new, :index, :create]

  def all_matches
    @matches = (params[:tab] == "closed") ? Match.closed : Match.opened
  end

  def index
    @matches = Match.where(game_id: @game.id).ordered
  end

  def new
    @match = Match.new
    @players = Player.all
  end

  def create
    match = Match.new game_id: @game.id
    params[:match][:players].each do |hidden_field_hash|
      match.scores << Score.create(player_id: hidden_field_hash.last["player_id"])
    end
    match.save
    redirect_to game_matches_path(match.game)
  end

  def destroy
    match = Match.find params[:id]
    match.destroy
    redirect_to game_matches_path(match.game)
  end

  def close
    @match = Match.find params[:id]
  end

  def set_scores
    match = Match.find params[:id]
    match.update match_params.merge(open_status: false)
    redirect_to root_path
  end

  def reopen
    match = Match.find params[:id]
    match.update(open_status: true, duration: 0)
    match.reset_scores_and_duration
    redirect_to game_matches_path(match.game_id)
  end

  def match_params
    params.require(:match).permit(:duration, scores_attributes: [:points, :id])
  end

  def find_game
    @game = Game.find params[:game_id]
  end
end

