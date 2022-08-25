# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

require 'rails_helper'

RSpec.describe 'the Farm creation' do
  it 'links to the new page from Farm index' do
    visit "/farms"

    click_link("New Farm")
    expect(current_path).to eq('/farms/new')
  end

  it 'can create a new artist' do
    visit "/farms/new"

    fill_in('name', with: 'Outback Farm')
    fill_in('acres_of_land', with: 400)
    fill_in('has_barn', with: true)
    click_button('Create Farm')

    new_farm = Farm.last
    expect(current_path).to eq("/farms")
    expect(page).to have_content('Outback Farm')
  end

end