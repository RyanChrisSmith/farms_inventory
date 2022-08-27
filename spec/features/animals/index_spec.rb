require 'rails_helper'

RSpec.describe 'Animals' do

  it 'shows all of the species of the animals for the farm' do
    farm = Farm.create!(name: 'Knotsbury', acres_of_land: 200, has_barn: true)
    animal = farm.animals.create!(species: 'horse', height: 255, weight: 400, four_legged: true)
    animal_2 = farm.animals.create!(species: 'chicken', height: 5, weight: 10, four_legged: false)

    visit "/animals"

    expect(page).to have_content(animal.species)
    expect(page).to have_content(animal_2.species)
    expect(page).to have_content(animal.height)
    expect(page).to have_content(animal_2.height)
    expect(page).to have_content(animal.weight)
    expect(page).to have_content(animal_2.weight)
    expect(page).to have_content(animal.four_legged)
    expect(page).to have_content(animal_2.four_legged)
  end

  it 'has a link directing back to the All Animals page' do
    visit "/animals"
    click_on "All animals"

    expect(current_path).to eq("/animals")
  end

  it 'has a link directing back to the All Farms page' do
    visit "/animals"
    click_on "All farms"

    expect(current_path).to eq("/farms")
  end

  it 'has a link directing to edit the animal' do
    farm = Farm.create!(name: 'Knotsbury', acres_of_land: 200, has_barn: true)
    animal = farm.animals.create!(species: 'horse', height: 255, weight: 400, four_legged: true)

    visit "/animals"
    click_on "edit :"

    expect(current_path).to eq("/animals/#{animal.id}/edit")
  end

end
