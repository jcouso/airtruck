class City < ApplicationRecord
  has_many :trips

  def self.city_state
    self.all.map {|city| City.new(name: "#{city.state} - #{city.name}", id: city.id) }
  end
end
