class User < ApplicationRecord 
    has_secure_password
    validates :name, presence: true
    has_many :reviews 
    has_many :coffees, through: :reviews

    def user_reviews
        if self.reviews.count == 0 
            "This user has not reviewed any coffees yet!"
        end
    end

end