class City < ApplicationRecord
  has_many :trips
  geocoded_by :full_name
  after_validation :geocode, if: :name_changed? || :state_changed?

  def self.city_state
    self.all.map {|city| City.new(name: "#{city.state} - #{city.name}", id: city.id) }
  end

  def full_name
    "#{self.name}, #{self.state}"
  end
end
