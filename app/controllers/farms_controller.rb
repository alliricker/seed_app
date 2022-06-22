class FarmsController < ApplicationController
    def show
      @farm = Farm.find(params[:id])
    end
  
    def index
      @farms = Farm.all
    end
  
    def new
      @farm = Farm.new
      @farm.coffees.build(name: 'Coffee')
    end
  
    def create
      Farm.create(farm_params)
      redirect_to farms_path
    end
  end
  
  private
  
  def farm_params
    params.require(:farm).permit(
      :name,
      :producer,
      :region,
    coffees_attributes: [
      :name
    ]
  )
  end