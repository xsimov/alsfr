class Match < ActiveRecord::Base
  belongs_to :game
  has_many :scores
  has_many :players, through: :scores
end
