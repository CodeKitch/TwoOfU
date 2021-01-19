class User < ApplicationRecord
    has_many :tricks
    has_many :tips
    has_many :trick_tips, through: :tips, source: :tricks
    has_many :categories, through: :tricks

    has_secure_password
end
