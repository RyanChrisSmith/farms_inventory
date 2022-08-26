# As a visitor
# When I visit a Parent Children Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

require 'rails_helper'

RSpec.describe 'new animal' do
  it 'can get the user to the creation page of a new animal for the farm' do
    farm = Farm.create!(name: 'Knotsbury', acres_of_land: 200, has_barn: true)

    visit "/farms/#{farm.id}/animals"
    click_on "New animal"

    expect(current_path).to eq("/farms/#{farm.id}/animals/new")
  end

  it 'can create a new animal and redirect back to the farm animals page' do
    @farm = Farm.create!(name: 'Knotsbury', acres_of_land: 200, has_barn: true)

    visit "/farms/#{@farm.id}/animals/new"
    fill_in('Species', with: "horse")
    fill_in('Height', with: 255)
    fill_in('Weight', with: 500)
    fill_in('Four legged', with: true)
    click_button('Create Animal')

    expect(current_path).to eq("/farms/#{@farm.id}/animals")
    expect(page).to have_content('horse')
  end
end