class Recipe < ApplicationRecord

  has_many :users
  has_many :likes

end
