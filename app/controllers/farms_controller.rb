class FarmsController < ApplicationController
  def index
    @farms = Farm.all
  end

  def show
    @farms = Farm.all
  end
end