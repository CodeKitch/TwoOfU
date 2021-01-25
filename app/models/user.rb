class User < ApplicationRecord
    has_many :tricks
    has_many :tips
    has_many :trick_tips, through: :tips, source: :tricks
    has_many :categories, through: :tricks

    has_secure_password

    validates :username, :email, presence: true

    def self.from_omniauth(response)
      User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
          u.username = response[:info][:name]
          u.email = response[:info][:email]
          u.password = SecureRandom.hex(15)
      end
  end

end
