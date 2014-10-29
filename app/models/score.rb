class Score < ActiveRecord::Base
  belongs_to :match
  belongs_to :player
  has_one :game, through: :match
end
