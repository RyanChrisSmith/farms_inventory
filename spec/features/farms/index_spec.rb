require 'rails_helper'

RSpec.describe Farm, type: :feature do
  describe 'For each parent table' do
    describe 'as a visitor, when I visit "/farms" ' do

      it 'will show the name of each farm in the system' do
        @farm = Farm.create!(name: 'Knotsbury Farm', acres_of_land: 350, has_barn: true)

        visit '/farms'

        expect(page).to have_content(@farm.name)
       end

    end
  end
end