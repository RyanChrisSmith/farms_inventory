class Farm < ApplicationRecord
  has_many :animals, dependent: :destroy

  def total_animals
    animals.length
  end

end