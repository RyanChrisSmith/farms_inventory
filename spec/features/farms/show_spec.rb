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
  end
end