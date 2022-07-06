class CategoriesController < ApplicationController

    def index
        if params[:coffee_id]
            @coffee = Coffee.find_by_id(params[:coffee_id])
            if @coffee.nil?
                redirect_to coffees_path, alert: "Coffee Not Found"
            else
                @category = @coffee.categories
            end
        else
            @categories = Category.all
        end
    end

    def show
        if params[:coffee_id]
            @coffee = Coffee.find_by_id(params[:coffee_id])
            @category = @coffee.categories.find_by_id(params[:id])
            if @category.nil?
                redirect_to coffee_categories_path(@coffee), alert: "Category Not Found"
            end
        else
            @category = Category.find_by_id(params[:id])
        end
    end

    def top_categories
    end
end