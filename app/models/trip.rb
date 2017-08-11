class Trip < ApplicationRecord
  belongs_to :truck
  has_many :orders
  has_one :user, through: :truck
  belongs_to :city_origin,  class_name: 'City', foreign_key: 'city_origin_id'
  belongs_to :city_destination, class_name: 'City', foreign_key: 'city_destination_id'
end
