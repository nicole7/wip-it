class Favorite < ApplicationRecord
  has_many :users
  belongs_to :post

  validates :user_id, uniqueness: { scope: :post_id }
end
