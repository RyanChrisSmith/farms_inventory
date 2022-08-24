# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@farm = Farm.create!(name: 'Jims', acres_of_land: 34, has_barn: false)
@farm_2 = Farm.create!(name: 'Knotsbury Farm', acres_of_land: 350, has_barn: true)
@farm_3 = Farm.create!(name: 'Pillsbury Farm', acres_of_land: 1350, has_barn: false)
@farm_4 = Farm.create!(name: 'Living Farm', acres_of_land: 350, has_barn: true)
@dog = @farm.animals.create!(species: 'dog', height: 34, weight: 75, four_legged: true)
@cat = @farm.animals.create!(species: 'cat', height: 4, weight: 15, four_legged: true)
@horse = @farm.animals.create!(species: 'horse', height: 234, weight: 375, four_legged: true)
@cow = @farm.animals.create!(species: 'cow', height: 204, weight: 815, four_legged: true)
@chicken = @farm_2.animals.create!(species: 'chicken', height: 23, weight: 3, four_legged: false)
@duck = @farm_2.animals.create!(species: 'duck', height: 14, weight: 10, four_legged: false)
@goat = @farm_3.animals.create!(species: 'goat', height: 85, weight: 125, four_legged: true)
@pig = @farm_4.animals.create!(species: 'pig', height: 24, weight: 35, four_legged: true)