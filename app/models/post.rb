class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favoriting_users, through: :favorites
  has_many :commenting_users, through: :comments, source: :user
  has_many :comments, dependent: :destroy
end
