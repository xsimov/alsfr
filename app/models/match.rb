class Match < ActiveRecord::Base
  belongs_to :game
  has_many :scores
  has_many :players, through: :scores
  scope :opened, -> { where(open_status: true) }
  scope :closed, -> { where(open_status: false) }
  accepts_nested_attributes_for :scores, allow_destroy: true

  def beautified_created_at
    self.created_at.strftime("%-d.%-m.%Y a les %l:%Mh %P")
  end
end
