class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end

  def show

  end
end