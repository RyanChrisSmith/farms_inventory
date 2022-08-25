class FarmsController < ApplicationController
  def index
    @farms = Farm.all
    @farms_sorted = Farm.all.order("created_at DESC")
  end

  def show
    @farm = Farm.find(params[:id])
  end
end