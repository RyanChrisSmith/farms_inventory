class CreateFarms < ActiveRecord::Migration[5.2]
  def change
    create_table :farms do |t|
      t.string :name
      t.integer :acres_of_land
      t.boolean :has_barn

      t.timestamps
    end
  end
end
