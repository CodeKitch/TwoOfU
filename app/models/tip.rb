class Tip < ApplicationRecord
  belongs_to :user
  belongs_to :trick
  
  validates :note, presence: true

  validates :trick, uniqueness: {scope: :user_id, message: "may only have one tip per user"}
end
