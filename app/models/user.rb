class User < ApplicationRecord

has_secure_password
validate :first_name, :last_name, :email, presence: true
has_many :recipes
has_many :likes
has_many :friends, through: :friendships

end
