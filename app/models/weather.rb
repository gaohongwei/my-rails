class Weather < ApplicationRecord
  belongs_to :city

  # enum :wether, {1: rain, ...}
  def self.recent(days = 10)
    where("date > ?", Date.today).order(:date).limit(days)
  end
end
