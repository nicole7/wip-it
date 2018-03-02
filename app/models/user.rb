class User < ApplicationRecord

has_secure_password
validate :first_name, :last_name, :email, presence: true
has_many :recipes
has_many :notifications, dependent: :destroy
has_many :friendships, dependent: :destory
has_many :comments, dependent: :destroy
has_many :likes, dependent: :destroy
has_many :friends, -> { where("status = 'accepted'") }, through: :friendships
has_many :requested_friends, -> { where("status = 'requested'") }, source: :friend
has_many :pending_friends, -> { where("status = 'pending") }, through: :friendship, source: :friend

end
