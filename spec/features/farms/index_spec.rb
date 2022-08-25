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

    end
  end
end