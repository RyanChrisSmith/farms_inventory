class Farm < ApplicationRecord
  has_many :animals

  def total_animals
    self.animals.length
  end

end