class CoffeesController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index, :show]

    def new
        @coffee = Coffee.new
        @coffee.categories.build
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

    def destroy
        @coffee = Coffee.find(params[:id])
        @coffee.reviews.clear
        @coffee.destroy
        redirect_to '/coffees/new'
        flash[:message] = "#{@coffee.name} Deleted!"
    end

        


    
private

    def require_login
      return head(:forbidden) unless session.include? :user_id
    end

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