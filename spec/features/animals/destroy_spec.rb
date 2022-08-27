# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this ch

require 'rails_helper'

RSpec.describe 'animal delete' do
  it 'will delete the record of the animal' do
    @farm = Farm.create!(name: 'Knotsbury', acres_of_land: 200, has_barn: true)
    @animal = @farm.animals.create!(species: 'horse', height: 255, weight: 400, four_legged: true)

    visit "/animals/#{@animal.id}"
    click_button "Delete #{@animal.species}"

    expect(current_path).to eq("/animals")
    expect(page).to_not have_content('horse')
  end
end