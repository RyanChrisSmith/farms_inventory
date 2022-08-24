require 'rails_helper'

RSpec.describe Farm, type: :model do
  it {should have_many :animals}

  describe 'instance methods' do
    describe '#total_animals' do

      before :each do
        @farm = Farm.create!(name: 'Jims', acres_of_land: 34, has_barn: false)
        @dog = @farm.animals.create!(species: 'dog', height: 34, weight: 75, four_legged: true)
        @cat = @farm.animals.create!(species: 'cat', height: 4, weight: 15, four_legged: true)
      end

      it 'returns the total animals on the farm' do
        expect(@farm.total_animals).to eq 2
        @pig = @farm.animals.create!(species: 'pig', height: 4, weight: 15, four_legged: true)
        expect(@farm.total_animals).to eq 3
      end

      it 'will sort all farms by date created' do
        @farm = Farm.create!(name: 'Knotsbury Farm', acres_of_land: 350, has_barn: true)
        @farm = Farm.create!(name: 'Pillsbury Farm', acres_of_land: 1350, has_barn: false)
        @farm = Farm.create!(name: 'Living Farm', acres_of_land: 350, has_barn: true)
        require 'pry' ; binding.pry
      end
    end
  end
end