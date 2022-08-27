# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent

require 'rails_helper'

RSpec.describe 'Farms delete' do
  it 'can delete the farm starting at show page' do
    @farm = Farm.create!(name: 'Knotsbury Farm', acres_of_land: 350, has_barn: true)

    visit "/farms/#{@farm.id}"
    click_button "Delete #{@farm.name}"

    expect(current_path).to eq("/farms")
    expect(page).to_not have_content('Knotsbury Farm')
  end

  it 'can delete the farm starting from index page' do
    @farm = Farm.create!(name: 'Knotsbury Farm', acres_of_land: 350, has_barn: true)

    visit "/farms"
    click_button "Delete #{@farm.name}"

    expect(current_path).to eq("/farms")
    expect(page).to_not have_content('Knotsbury Farm')
  end


end