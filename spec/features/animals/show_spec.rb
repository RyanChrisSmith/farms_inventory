require 'rails_helper'

RSpec.describe 'the animals show page' do 
  it 'displays the animal species' do
    animal = Animal.create!(species: 'horse', height: 255, weight: 400, four_legged: true)
    visit "/animals/#{animal.id}"
  end

  it 'displays the name of the farm for the animal'
end