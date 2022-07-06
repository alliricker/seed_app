class ReviewsController < ApplicationController

    def new 
            @review = Review.new 
    end

    def create 
        @review = current_user.reviews.build(review_params)
        if @review.save 
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def index 
        @reviews = @user.reviews.all 
    end

    def show 
        @review = Review.find(params[:id])
    end

    def edit
        @review = Review.find(params[:id])
    end

    def update 
        @review= Review.find(params[:id])
        @review.update(rating: params[:review][:rating], comment: params[:review][:comment])
        redirect_to review_path(@review)
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
 
