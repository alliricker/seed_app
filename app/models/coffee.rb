class Coffee < ApplicationRecord
    has_many :reviews 
    has_many :users, through: :reviews

    ROASTS = ['light', 'medium', 'dark']
    
end 