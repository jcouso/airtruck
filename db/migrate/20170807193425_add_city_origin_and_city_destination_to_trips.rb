class AddCityOriginAndCityDestinationToTrips < ActiveRecord::Migration[5.0]
  def change
    add_reference :trips, :city_origin, index: true
    add_reference :trips, :city_destination, index: true

    add_foreign_key :trips, :cities, column: :city_origin_id
    add_foreign_key :trips, :cities, column: :city_destination_id
  end
end
