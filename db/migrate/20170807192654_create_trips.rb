class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.datetime :departure_date
      t.datetime :arrival_date
      t.string :departure_address
      t.string :arrival_address
      t.integer :vacancies
      t.integer :price
      t.references :truck, foreign_key: true

      t.timestamps
    end
  end
end
