class Farm < ApplicationRecord
  has_many :animals

  def total_animals
    animals.length
  end

end