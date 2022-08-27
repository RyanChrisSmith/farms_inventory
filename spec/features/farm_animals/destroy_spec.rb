require 'rails_helper'

RSpec.describe 'animal delete' do
  it 'will delete the record of the animal from show page' do
    @farm = Farm.create!(name: 'Knotsbury', acres_of_land: 200, has_barn: true)
    @animal = @farm.animals.create!(species: 'horse', height: 255, weight: 400, four_legged: true)

    visit "/farms/#{@farm.id}/animals"
    click_button "Delete #{@animal.species}"

    expect(current_path).to eq("/animals")
    expect(page).to_not have_content('horse')
  end
end