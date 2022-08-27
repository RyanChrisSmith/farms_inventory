require 'rails_helper'

RSpec.describe 'FarmAnimals' do
  describe 'When I visit "/farms/:farm_id/animals"' do
    it 'I see each Animal that is associated with that Farm with each Animals attributes:' do
      farm = Farm.create!(name: 'Knotsbury', acres_of_land: 200, has_barn: true)
      animal = farm.animals.create!(species: 'horse', height: 255, weight: 400, four_legged: true)
      animal_2 = farm.animals.create!(species: 'chicken', height: 5, weight: 10, four_legged: false)

      visit "/farms/#{farm.id}/animals"
      expect(page).to have_content(farm.name)
      expect(page).to have_content(animal.species)
      expect(page).to have_content("Height: #{animal.height} inches")
      expect(page).to have_content("Weight: #{animal.weight} lbs")
      expect(page).to have_content(animal.four_legged)
    end
  end

  it 'has a link directing back to the All Animals page' do
    farm = Farm.create!(name: 'Knotsbury', acres_of_land: 200, has_barn: true)
    animal = farm.animals.create!(species: 'horse', height: 255, weight: 400, four_legged: true)
    animal_2 = farm.animals.create!(species: 'chicken', height: 5, weight: 10, four_legged: false)

    visit "/farms/#{farm.id}/animals"
    click_on "All animals"

    expect(current_path).to eq("/animals")
  end

  it 'has a link directing back to the All Farms page' do
    @farm = Farm.create!(name: 'Knotsbury', acres_of_land: 200, has_barn: true)
    animal = @farm.animals.create!(species: 'horse', height: 255, weight: 400, four_legged: true)
    animal_2 = @farm.animals.create!(species: 'chicken', height: 5, weight: 10, four_legged: false)

    visit "/farms/#{@farm.id}/animals"
    click_on "All farms"

    expect(current_path).to eq("/farms")
  end

  it 'will sort the farm animals in alphabetical order via a link' do
    @farm = Farm.create!(name: 'Knotsbury', acres_of_land: 200, has_barn: true)
    animal = @farm.animals.create!(species: 'horse', height: 255, weight: 400, four_legged: true)
    animal_2 = @farm.animals.create!(species: 'chicken', height: 5, weight: 10, four_legged: false)
    animal_3 = @farm.animals.create!(species: 'alpaca', height: 45, weight: 100, four_legged: true)

    visit "/farms/#{@farm.id}/animals"
    click_on "Sort animals alphabetically"

    expect(animal_3).to appear_before(animal_2)
    expect(animal_2).to appear_before(animal_1)
  end

  it 'has a link to direct to edit animal details' do
    @farm = Farm.create!(name: 'Knotsbury', acres_of_land: 200, has_barn: true)
    animal = @farm.animals.create!(species: 'horse', height: 255, weight: 400, four_legged: true)

    visit "/farms/#{@farm.id}/animals"
    click_on "edit #{animal.species}"

    expect(current_path).to eq("/farms/#{@farm.id}/animals/#{animal.id}/edit")
  end

end