# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information
require 'rails_helper'

RSpec.describe 'animal edit' do
  it 'will show on the animal specific page to link to update the animal' do
    @farm = Farm.create!(name: 'Knotsbury', acres_of_land: 200, has_barn: true)
    @animal = @farm.animals.create!(species: 'horse', height: 255, weight: 400, four_legged: true)

    visit "animals/#{@animal.id}"
    click_on "Update #{@animal.species}"

    expect(current_path).to eq("/animals/#{@animal.id}/edit")
  end

  it 'will edit and update the animal, redirecting back to individual animal page' do
    @farm = Farm.create!(name: 'Knotsbury', acres_of_land: 200, has_barn: true)
    @animal = @farm.animals.create!(species: 'horse', height: 255, weight: 400, four_legged: true)

    visit "animals/#{@animal.id}/edit"
    fill_in('Species', with: 'mini-horse')
    fill_in('Height', with: 25)
    fill_in('Weight', with: 120)
    fill_in('Four legged', with: false)
    click_button "Update #{@animal.species}"

    expect(current_path).to eq("/animals/#{@animal.id}")
    expect(page).to have_content('mini-horse')
  end
end