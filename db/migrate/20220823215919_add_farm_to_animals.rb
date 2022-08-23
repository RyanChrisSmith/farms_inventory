class AddFarmToAnimals < ActiveRecord::Migration[5.2]
  def change
    add_reference :animals, :farm, foreign_key: true
  end
end
