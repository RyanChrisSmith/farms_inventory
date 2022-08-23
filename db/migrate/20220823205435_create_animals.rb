class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :species
      t.integer :height
      t.integer :weight
      t.boolean :four_legged

      t.timestamps
    end
  end
end
