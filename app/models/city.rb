class City < ApplicationRecord
  has_many :weathers


  def self.by_name(name)
    if name.blank?
      City.first
    else
      where(name: name).first
    end
  end
end
