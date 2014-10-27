class Game < ActiveRecord::Base
  has_many :badges
  has_many :scores
end
