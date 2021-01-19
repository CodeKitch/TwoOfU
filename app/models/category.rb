class Category < ApplicationRecord
    has_many :tricks
    has_many :users, through: :tricks 
end
