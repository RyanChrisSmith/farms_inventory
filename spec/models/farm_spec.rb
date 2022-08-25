require 'rails_helper'

RSpec.describe Farm, type: :model do
  it {should have_many :animals}

  describe 'instance methods' do
    describe '#total_animals' do

      before :each do
        @farm = Farm.create!(name: 'Funny Farm', acres_of_land: 34, has_barn: false)
        @dog = @farm.animals.create!(species: 'dog', height: 34, weight: 75, four_legged: true)
        @cat = @farm.animals.create!(species: 'cat', height: 4, weight: 15, four_legged: true)
      end

      it 'returns the total animals on the farm' do
        expect(@farm.total_animals).to eq 2
        @pig = @farm.animals.create!(species: 'pig', height: 4, weight: 15, four_legged: true)
        expect(@farm.total_animals).to eq 3
      end
    end
  end
end