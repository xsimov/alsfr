class Match < ActiveRecord::Base
  belongs_to :game
  has_many :scores, dependent: :destroy
  has_many :players, through: :scores
  scope :opened, -> { where(open_status: true).ordered }
  scope :closed, -> { where(open_status: false).ordered }
  scope :ordered, -> { order(open_status: :desc).order(created_at: :desc) }
  accepts_nested_attributes_for :scores
  validates :duration, presence: true, numericality: {greater_than: 0}, on: :update, if: "closed?"

  def beautified_created_at
    created_at.strftime("%-d.%-m.%Y a les %l:%Mh %P")
  end

  def reset_scores_and_duration
    duration = 0
    scores.map { |score| score.points = 0;score.save }
  end

  def closed?
    !open_status
  end
end