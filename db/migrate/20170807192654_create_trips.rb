class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :departure_date
      t.datetime :arrival_date
      t.datetime :departure_address
      t.string :arrival_address
      t.integer :vacancies
      t.integer :price
      t.references :truck, foreign_key: true

      t.timestamps
    end
  end
end
