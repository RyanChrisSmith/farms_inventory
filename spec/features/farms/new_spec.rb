require 'rails_helper'

RSpec.describe 'the Farm creation' do
  it 'links to the new page from Farm index' do
    visit "/farms"

    click_link("New Farm")
    expect(current_path).to eq('/farms/new')
  end

  it 'can create a new farm' do
    visit "/farms/new"

    fill_in('name', with: 'Outback Farm')
    fill_in('acres_of_land', with: 400)
    fill_in('has_barn', with: true)
    click_button('Create Farm')

    expect(current_path).to eq("/farms")
    expect(page).to have_content('Outback Farm')
  end

end