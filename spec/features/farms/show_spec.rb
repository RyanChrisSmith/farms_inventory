require 'rails_helper'

RSpec.describe 'Show' do
  describe 'As a visitor when I visit "/farms/:id"' do
    it 'shows the farm and all of its attributes' do
      @farm = Farm.create!(name: 'Knotsbury Farm', acres_of_land: 350, has_barn: true)

      visit "/farms/#{@farm.id}"

      expect(page).to have_content(@farm.name)
      expect(page).to have_content("ID: #{@farm.id}")
      expect(page).to have_content("Acres: #{@farm.acres_of_land}")
      expect(page).to have_content("Has a barn: #{@farm.has_barn}")
    end

    it 'shows the total animals of the farm' do
      @farm = Farm.create!(name: 'Knotsbury Farm', acres_of_land: 350, has_barn: true)

      visit "/farms/#{@farm.id}"
      expect(page).to have_content(@farm.total_animals)
    end

    it 'has a link directing back to the All Animals page' do
      farm = Farm.create!(name: 'Knotsbury', acres_of_land: 200, has_barn: true)
      animal = farm.animals.create!(species: 'horse', height: 255, weight: 400, four_legged: true)
      animal_2 = farm.animals.create!(species: 'chicken', height: 5, weight: 10, four_legged: false)

      visit "/farms/#{farm.id}"
      click_on "All animals"

      expect(current_path).to eq("/animals")
    end

    it 'has a link directing back to the All Farms page' do
      farm = Farm.create!(name: 'Knotsbury', acres_of_land: 200, has_barn: true)
      animal = farm.animals.create!(species: 'horse', height: 255, weight: 400, four_legged: true)
      animal_2 = farm.animals.create!(species: 'chicken', height: 5, weight: 10, four_legged: false)

      visit "/farms/#{farm.id}"
      click_on "All farms"

      expect(current_path).to eq("/farms")
    end
  end
end