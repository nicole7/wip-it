class Recipe < ApplicationRecord
  belongs_to :users
  has_many :likes, as: :likable, dependent: :destroy
  # has_many :comments, as: :commentable, dependent: :destroy
  validats :user, presence: true
  validates :content, presence: true, associated: true
  default_scope { order(id: :desc) }
end
