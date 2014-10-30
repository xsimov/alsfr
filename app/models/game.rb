class Game < ActiveRecord::Base
  has_many :badges
  has_many :matches
  has_many :scores, through: :matches
  has_many :players, through: :scores

  def average_duration
    total_duration = 0
    self.matches.each do |match|
      total_duration += match.duration      
    end
    beautify_time(total_duration / self.matches.count)
  end

  def beautify_time total_minutes
    hours = total_minutes / 60
    minutes = total_minutes % 60
    beautified_string = "#{hours} hores"
    beautified_string += "i #{minutes} minuts" unless minutes == 0
    beautified_string
  end
end
