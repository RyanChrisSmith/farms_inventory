class FarmAnimalsController < ApplicationController
  def index
    @farm = Farm.find(params[:farm_id])
    @animals = @farm.animals
  end

end