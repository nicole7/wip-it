class Recipe < ApplicationRecord
  has_many :likes, as: :likable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
end

