require 'rails_helper'

RSpec.describe Farm, type: :feature do
  describe 'For each parent table' do
    describe 'as a visitor, when I visit "/farms" ' do

      it 'will show the name of each farm in the system' do
        @farm = Farm.create!(name: 'Knotsbury Farm', acres_of_land: 350, has_barn: true)

        visit '/farms'

        expect(page).to have_content(@farm.name)
      end

      it 'will show the farms by creation time, with most recent showing first' do
        @farm = Farm.create!(name: 'Knotsbury Farm', acres_of_land: 350, has_barn: true)
        @farm_2 = Farm.create!(name: 'Ryans Farm', acres_of_land: 340, has_barn: true)
        @farm_3 = Farm.create!(name: 'Crazy Farm', acres_of_land: 134, has_barn: false)

        visit '/farms'
        expect(@farm_3.name).to appear_before(@farm_2.name)
        expect(@farm_3.name).to appear_before(@farm.name)
        expect(@farm_2.name).to appear_before(@farm.name)
      end

      it 'will show the farms creation time' do
        @farm = Farm.create!(name: 'Knotsbury Farm', acres_of_land: 350, has_barn: true)
        @farm_2 = Farm.create!(name: 'Ryans Farm', acres_of_land: 340, has_barn: true)
        @farm_3 = Farm.create!(name: 'Crazy Farm', acres_of_land: 134, has_barn: false)

        visit '/farms'

        expect(page).to have_content(@farm.created_at)
      end

      it 'has a link directing back to the All Animals page' do
        farm = Farm.create!(name: 'Knotsbury', acres_of_land: 200, has_barn: true)
        animal = farm.animals.create!(species: 'horse', height: 255, weight: 400, four_legged: true)
        animal_2 = farm.animals.create!(species: 'chicken', height: 5, weight: 10, four_legged: false)

        visit "/farms"
        click_on "All animals"

        expect(current_path).to eq("/animals")
      end

      it 'has a link directing back to the All Farms page' do
        farm = Farm.create!(name: 'Knotsbury', acres_of_land: 200, has_barn: true)
        animal = farm.animals.create!(species: 'horse', height: 255, weight: 400, four_legged: true)
        animal_2 = farm.animals.create!(species: 'chicken', height: 5, weight: 10, four_legged: false)

        visit "/farms"
        click_on "All farms"

        expect(current_path).to eq("/farms")
      end

    end
  end
end