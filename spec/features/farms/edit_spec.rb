# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

require 'rails_helper'

RSpec.describe 'Farm Edit' do
  it 'links to the edit page via update farm' do
    farm = Farm.create!(name: 'Jims', acres_of_land: 34, has_barn: false)

    visit "/farms/#{farm.id}"
    click_button "Update #{farm.name}"

    expect(current_path).to eq("/farms/#{farm.id}/edit")
  end

  it 'can edit the farm' do
    farm = Farm.create!(name: 'Jims', acres_of_land: 34, has_barn: false)

    visit "/farms/#{farm.id}/edit"
    fill_in('name', with: 'Jims Farm')
    fill_in('acres_of_land', with: 6000)
    fill_in('has_barn', with: true)
    click_button 'Update Farm'

    expect(current_path).to eq("/farms/#{farm.id}")
    expect(page).to have_content('Jims Farm')
  end
end