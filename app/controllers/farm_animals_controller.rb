class FarmAnimalsController < ApplicationController
  def index
    @farm = Farm.find(params[:farm_id])
    @animals = @farm.animals.order(params[:sort])
  end

  # def search_weight
  #   @animals = []
  #   @farm = Farm.find(params[:farm_id])
  #   @animals << @farm.animals.where{|animal| animal.weight > (params[:search].to_i)}
  # end

end