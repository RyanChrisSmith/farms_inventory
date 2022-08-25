class FarmsController < ApplicationController
  def index
    @farms = Farm.all
    @farms_sorted = Farm.all.order("created_at DESC")
  end

  def show
    @farm = Farm.find(params[:id])
  end

  def new
  end

  def create
    @farm = Farm.create(name: params[:name], acres_of_land: params[:acres_of_land], has_barn: params[:has_barn])
    redirect_to "/farms"
  end

end