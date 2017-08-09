class Truck < ApplicationRecord
  belongs_to :user
  has_many :trips, dependent: :destroy
end
