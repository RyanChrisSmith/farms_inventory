require 'rails_helper'

RSpec.describe Farm, type: :feature do
  describe 'For each parent table' do
    describe 'as a visitor, when I visit "/farms" ' do

      it 'will show the name of each farm in the system' do
        @farm = Farm.create!(name: 'Knotsbury Farm', acres_of_land: 350, has_barn: true)

        visit '/farms'

        expect(page).to have_content(@farm.name)
      end

      # it 'will display each farm in order of most recently created descending' do
      #   @farm = Farm.create!(name: 'Knotsbury Farm', acres_of_land: 350, has_barn: true)
      #   @farm = Farm.create!(name: 'Pillsbury Farm', acres_of_land: 1350, has_barn: false)
      #   @farm = Farm.create!(name: 'Living Farm', acres_of_land: 350, has_barn: true)
      #   require 'pry' ; binding.pry
      # end

    end
  end
end