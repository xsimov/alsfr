class Player < ActiveRecord::Base
  has_many :scores, dependent: :destroy
  has_many :matches, through: :scores
  has_many :games, through: :matches
  has_and_belongs_to_many :badges

  def total_points
    total = 0
    self.scores.each do |score|
      total += score.points
    end
    total
  end

  def total_score_for game
    all_scores = Score.where(player_id: self.id, game_id: game.id)
    binding.pry
  end
end
