class CoffeesController < ApplicationController
    def new
        @coffee = Coffee.new
    end

    def create
        @coffee = Coffee.create(coffee_params)
        redirect_to coffee_path(@coffee)
    end

    def index
    end

    def show
        @coffee = Coffee.find_by(id: params[:id])
    end
    


private

    def coffee_params
      params.require(:coffee).permit(
          :name,
          :origin,
          :roast,
          :year)
    end

end