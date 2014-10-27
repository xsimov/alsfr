class BadgesController < ApplicationController
  def new    
  end

  def create
    Badge.save title: params[:title], points: params[:points], game: params[:game_id]
  end

  def assign_badge
    player = Player.find params[:id]
  end
end
