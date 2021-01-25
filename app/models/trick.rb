class Trick < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :tips, dependent: :delete_all
  has_many :users, through: :tips

  validates :ilk, :name, presence: true



  delegate :ilk, to: :category

  scope :alpha, -> { order(:ilk) }
  scope :most_tips, -> {left_joins(:tips).group('tricks.id').order('count(tips.trick_id) desc')}

def self.filter(params)
  where("category_id = ?", params)
end

def self.search(params)
  left_joins(:tips).where("LOWER(posts.name) LIKE :term OR LOWER(posts.note) LIKE :term OR LOWER(tips.note) LIKE :term", term: "%#{params}%")
end

def category_attributes=(attr)
  self.category = Category.find_or_create_by(attr) if !attr[:ilk].blank?
end

end