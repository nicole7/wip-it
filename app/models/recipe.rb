class Recipe < ApplicationRecord
  belongs_to :users
  has_many :likes, as: :likable, dependent: :destroy
  # has_many :comments, as: :commentable, dependent: :destroy
  validates :users, presence: true
  validates :content, presence: true, associated: true
  default_scope { order(id: :desc) }
end


# nicole = User.create(first_name: "Nicole", last_name: "Gasperini", email: "nicole@nicole.com", password: "boo")


# Recipe.create(id: 1, recipe: "Something", uri: "hey", label: "food", image: "image_string", source: "hey", tags: "hey", ingredientLines: "hey", ingredients: "Hey", calories: "12", totalWeight: "12", totalNutrients: "12", bookarked: false, bought: true)