class Trick < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :tips, dependent: :delete_all
  has_many :users, through: :tips

  validates :ilk, :name, presence: true

  delegate :ilk, to: :category, allow_nil: true

  scope :alpha, -> { order(:ilk) }

  scope :find_magic, ->(pmagic) { where('name LIKE ?', "%#{pmagic}%")}
  # scope :with_long_title, ->(length) { where("LENGTH(title) > ?", length) }


  scope :most_tips, -> {left_joins(:tips).group('tricks.id').order('count(tips.trick_id) desc')}

    def category_attributes=(attr)
    self.category = Category.find_or_create_by(attr) if !attr[:ilk].blank?
  end

end