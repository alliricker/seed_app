class RoastersController < ApplicationController

    def index
        if params[:coffee_id]
            @coffee = Coffee.find_by_id(params[:coffee_id])
            if @coffee.nil?
                redirect_to coffees_path, alert: "Coffee Not Found"
            else
                @roasters = @coffee.roasters
            end
        else
            @roasters = Roaster.all
        end
    end

    def show
        if params[:coffee_id]
            @coffee = Coffee.find_by_id(params[:coffee_id])
            @roaster = @coffee.roasters.find_by_id(params[:id])
            if @roaster.nil?
                redirect_to coffee_roasters_path(@coffee), alert: "Roaster Not Found"
            end
        else
            @roaster = Roaster.find_by_id(params[:id])
        end
    end

    def top_roasters
    end
end