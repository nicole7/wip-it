 class User < ApplicationRecord
# devise :database_authenticatable, :encryptable
has_secure_password

validates :first_name, :last_name, :email, presence: true

has_many :recipes
has_many :favorites, dependent: :destroy
has_many :posts
has_many :favorite_posts, class_name: 'Post', through: :favorites

has_many :notifications, dependent: :destroy
has_many :friendships
has_many :friends, :through => :friendships
has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
has_many :inverse_friends, :through => :inverse_friendships, :source => :user

has_many :comments, dependent: :destroy
has_many :guest_comments, through: :comments, source: :post
has_many :likes, dependent: :destroy


def to_favorite!(post)
  self.favorites.create!(post_id: post.id)
end

def un_favorite!(post)
  favorite = self.favorites.find_by_post_id(post.id)
  favorite.destroy!
end

def favorite?(post)
  self.favorites.find_by_post_id(post.id)
end

end
