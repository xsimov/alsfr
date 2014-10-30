class Player < ActiveRecord::Base
  has_many :scores
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
end
