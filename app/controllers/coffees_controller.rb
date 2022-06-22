class CoffeesController < ApplicationController
    def new
        @coffee = Coffee.new
        @coffee.roasters.build
    end

    def create
        @coffee = Coffee.new(coffee_params)
        if @coffee.save 
            redirect_to coffee_path(@coffee)
        else
            render :new 
        end
    end

    def index
        @coffees = Coffee.all   
    end

    def show
        @coffee = Coffee.find_by_id(params[:id])
    end
    
private

    def coffee_params
      params.require(:coffee).permit(
          :name,
          :origin,
          :roast,
          :year,
          roasters_attributes: [
              :name,
              :state
          ]
      )
    end

end