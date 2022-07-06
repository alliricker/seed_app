class CoffeesController < ApplicationController
    def new
        if logged_in?
        @coffee = Coffee.new
        @coffee.categories.build
        else 
            flash[:error] = "Please Log In to Create a New Coffee"
            redirect_to 'home'
        end
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

    def edit
        @coffee= Coffee.find(params[:id])
    end

    def update 
        @coffee = Coffee.find(params[:id])
        @coffee.update(name: params[:coffee][:name], origin: params[:coffee][:origin], year: params[:coffee][:year])
        redirect_to coffee_path(@coffee)
    end


    
private

    def coffee_params
      params.require(:coffee).permit(
          :name,
          :origin,
          :roast,
          :year,
          categories_attributes: [
              :name,
          ]
      )
    end

end