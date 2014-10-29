class Game < ActiveRecord::Base
  has_many :badges
  has_many :matches
  has_many :scores, through: :matches
  has_many :players, through: :scores

  def average_duration
    
  end
end
