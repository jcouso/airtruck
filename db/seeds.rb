# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "json"
require 'open-uri'
url = "https://gist.githubusercontent.com/letanure/3012978/raw/36fc21d9e2fc45c078e0e0e07cce3c81965db8f9/estados-cidades.json"
cities_serialized = open(url).read
cities = JSON.parse(cities_serialized)

cities["estados"].each do |estado|
  estado["cidades"].each  do |cidade|
     lugar = City.new(name: cidade, state: estado["nome"])
     lugar.save!
  end
end


