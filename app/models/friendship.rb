class Friendship < ApplicationRecord

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user, presence: true, uniqueness: { scope: :friend}
  validates :friend, presence: true
  validates :status, presence: true
end
