class User < ApplicationRecord 
    has_secure_password
    validates :name, presence: true
    has_many :reviews 
    has_many :coffees, through: :reviews
end