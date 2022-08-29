class FarmAnimalsController < ApplicationController
  def index
    if params[:search]
      search_weight
    else
    @farm = Farm.find(params[:farm_id])
    @animals = @farm.animals.order(params[:sort])
    end
  end

  def search_weight
    @animals = []
    @farm = Farm.find(params[:farm_id])
    @animals << @farm.animals.where{|animal| animal.weight > (params[:search].to_i)}
  end

end