class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
    @animals_only_true = Animal.where("four_legged = true")
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def new
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    @animal.update(animal_params)
    redirect_to "/animals/#{@animal.id}"
  end

  def create
    @farm = Farm.last
    @animal = @farm.animals.create(animal_params)
    redirect_to "/farms/#{@farm.id}/animals"
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
    redirect_to "/animals"
  end

private
  def animal_params
      params.permit(:species, :height, :weight, :four_legged)
  end

end