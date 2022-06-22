class Farm < ApplicationRecord
    has_many :coffees 
    accepts_nested_attributes_for :coffees
end