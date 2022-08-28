class FarmAnimalsController < ApplicationController
  def index
    @farm = Farm.find(params[:farm_id])
    @animals = @farm.animals.order(params[:sort])
  end

end