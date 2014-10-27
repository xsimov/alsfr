class Player < ActiveRecord::Base
  has_many :scores
  has_and_belongs_to_many :badges
end
