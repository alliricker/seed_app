class ReviewsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index, :show]
    before_action :correct_user, only: [:edit, :update, :destroy]

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

    def destroy
        Review.find(params[:id]).destroy
        redirect_to '/reviews/new'
        flash[:message] = "Review Deleted"
    end



    private

    def require_login
      return head(:forbidden) unless session.include? :user_id
    end

    def correct_user 
        @review = Review.find_by(id: params[:id])
        unless current_user?(@review.user)
            redirect_to reviews_path
        end
    end

    def review_params
        params.require(:review).permit(
            :user_id,
            :coffee_id,
            :rating,
            :comment,
        )
    end
end
 
