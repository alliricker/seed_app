class Coffee < ApplicationRecord
    has_many :reviews 
    has_many :users, through: :reviews
    has_many :roasters 
    accepts_nested_attributes_for :roasters

    validates :name, presence: true, uniqueness: true 

    ROASTS = ['light', 'medium', 'dark']
    
    def avg_rating
        if self.reviews.count == 0 
            "There are no reviews for this coffee yet!"
        else
            self.reviews.average(:rating)
        end
    end
end 