class Player < ActiveRecord::Base
  has_many :scores
  has_many :matches, through: :scores
  has_many :games, through: :matches
  has_and_belongs_to_many :badges

  def total_points
    23
  end
end
