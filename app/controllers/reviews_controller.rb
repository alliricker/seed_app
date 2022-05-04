class ReviewsController < ApplicationController

    def new 
        if @coffee = Coffee.find_by_id(params[:coffee_id])
            @review = @coffee.reviews.build 
        else
            @review = Review.new 
        end
    end

    def create 
        @review = current_user.reviews.build(review_params)
        if @review.save 
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def show 
        @coffee = @review.coffee
    end

    private

    def review_params
        params.require(:review).permit(
            :rating,
            :notes,
            :user_id,
            :coffee_id
        )
    end
 
end
