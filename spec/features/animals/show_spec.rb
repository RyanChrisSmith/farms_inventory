require 'rails_helper'

RSpec.describe 'the animals show page' do
  it 'displays the animal species' do
    farm = Farm.create!(name: 'Knotsbury', acres_of_land: 200, has_barn: true)
    animal = farm.animals.create!(species: 'horse', height: 255, weight: 400, four_legged: true)
    animal_2 = farm.animals.create!(species: 'chicken', height: 5, weight: 10, four_legged: false)

    visit "/animals/#{animal.id}"

    expect(page).to have_content(animal.species)
    expect(page).to_not have_content(animal_2.species)
  end

  it 'displays the name of the farm for the animal' do
    farm = Farm.create!(name: 'Knotsbury', acres_of_land: 200, has_barn: true)
    animal = farm.animals.create!(species: 'horse', height: 255, weight: 400, four_legged: true)
    animal_2 = farm.animals.create!(species: 'chicken', height: 5, weight: 10, four_legged: false)

    visit "/animals/#{animal.id}"

    expect(page).to have_content(farm.name)
  end

  it 'displays the animals attributes' do
    farm = Farm.create!(name: 'Knotsbury', acres_of_land: 200, has_barn: true)
    animal = farm.animals.create!(species: 'horse', height: 255, weight: 400, four_legged: true)
    animal_2 = farm.animals.create!(species: 'chicken', height: 5, weight: 10, four_legged: false)

    visit "/animals/#{animal.id}"

    expect(page).to have_content("Height: #{animal.height}")
    expect(page).to have_content("Weight: #{animal.weight}")
    expect(page).to have_content("Is four legged: #{animal.four_legged}")
  end
end