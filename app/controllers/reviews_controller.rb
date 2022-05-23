class ReviewsController < ApplicationController

    def new 
            @review = Review.new 
    end

    def create 
        @review = current_user.reviews.build(review_params)
        if @review.save 
            redirect_to review_path(@review)
        else
            render :show
        end
    end

    def index 
        @reviews = @user.reviews.all 
    end

    def show 
        @coffee = Coffee.find(params[:id])
        @review = Review.find(params[:id])
        
    end

    private

    def review_params
        params.require(:review).permit(
            :user_id,
            :coffee_id,
            :rating,
            :comment,
        )
    end
 
end
