class Coffee < ApplicationRecord
    has_many :reviews 
    has_many :users, through: :reviews
    has_many :categories
    accepts_nested_attributes_for :categories

    validates :name, presence: true, uniqueness: true 
    
    def avg_rating
        if self.reviews.count == 0 
            "There are no reviews for this coffee yet!"
        else
            self.reviews.average(:rating)
        end
    end
end 