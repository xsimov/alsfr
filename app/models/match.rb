class Match < ActiveRecord::Base
  belongs_to :game
  has_many :scores, dependent: :destroy
  has_many :players, through: :scores
  scope :opened, -> { where(open_status: true).ordered }
  scope :closed, -> { where(open_status: false).ordered }
  scope :ordered, -> { order(created_at: :desc) }
  accepts_nested_attributes_for :scores

  def beautified_created_at
    self.created_at.strftime("%-d.%-m.%Y a les %l:%Mh %P")
  end

  def reset_scores_and_duration
    self.duration = 0
    self.scores.map { |score| score.points = 0;score.save }
  end
end
