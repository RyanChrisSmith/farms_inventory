# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@farm = Farm.create!(name: 'Jims', acres_of_land: 34, has_barn: false)
@dog = @farm.animals.create!(species: 'dog', height: 34, weight: 75, four_legged: true)
@cat = @farm.animals.create!(species: 'cat', height: 4, weight: 15, four_legged: true)