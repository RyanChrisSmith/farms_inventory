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
    @farm = Farm.create(farms_params)
    redirect_to '/farms'
  end

  private
  def farms_params
    params.permit(:name, :acres_of_land, :has_barn)
  end

end