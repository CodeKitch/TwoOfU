User
    - username
    - email
    - password_digest
    has_many :tricks
    has_many :tips
    has_many :trick_tips, through: :tips, source: :tricks
    has_many :categories, through: :tricks

Trick
    - trick
    belongs_to :user
    belongs_to :category

Tip
    - tip
    belongs_to :user
    belongs_to :trick

Category
    - name
    has_many :tricks
    has_many :users, through: :tricks 



rails g resource user username email password_digest --no-test-framework
rails g resource tip user:belongs_to trick:belongs_to --no-test-framework
rails g resource trick user:belongs_to category:belongs_to --no-test-framework
rails g resource category name --no-test-framework


rails generate controller home index  --no-helper --no-assets --no-controller-specs --no-view-specs
