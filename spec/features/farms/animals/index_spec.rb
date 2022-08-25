# As a user
# When I visit an Farms Animals index 
# Then I see the species of all the Farms Animals 
# And I see that each specie is a link to the Animals show page

require 'rails_helper'

RSpec.describe 'Farms animals index' do
  before :each do
    @farm = Farm.create!(name: 'Jims', acres_of_land: 34, has_barn: false)
    @dog = @farm.animals.create!(species: 'dog', height: 34, weight: 75, four_legged: true)
    @cat = @farm.animals.create!(species: 'cat', height: 4, weight: 15, four_legged: true)
  end

    it 'shows all of the species of the animals for the farm' do
      visit "/farms/#{@farm.id}/animals"

      expect(page).to have_content(@dog.species)
      expect(page).to have_content(@cat.species)
    end

    it 'links to each animals show page' do
      visit "/farms/#{@farm.id}/animals"

      click_on @dog.species

      expect(current_path).to eq("/animals/#{@dog.id}")
    end

    it 'shows the total amount of animals at the farm' do
      visit "/farms/#{@farm.id}/animals"

      expect(page).to have_content("Total animals for Jims: 2")
    end

    it 'has a link directing back to the All Animals page' do
      farm = Farm.create!(name: 'Knotsbury', acres_of_land: 200, has_barn: true)
      animal = farm.animals.create!(species: 'horse', height: 255, weight: 400, four_legged: true)
      animal_2 = farm.animals.create!(species: 'chicken', height: 5, weight: 10, four_legged: false)

      visit "/farms/#{@farm.id}/animals"
      click_on "All animals"

      expect(current_path).to eq("/animals")
    end

    it 'has a link directing back to the All Farms page' do
      farm = Farm.create!(name: 'Knotsbury', acres_of_land: 200, has_barn: true)
      animal = farm.animals.create!(species: 'horse', height: 255, weight: 400, four_legged: true)
      animal_2 = farm.animals.create!(species: 'chicken', height: 5, weight: 10, four_legged: false)

      visit "/farms/#{@farm.id}/animals"
      click_on "All farms"

      expect(current_path).to eq("/farms")
    end

end
