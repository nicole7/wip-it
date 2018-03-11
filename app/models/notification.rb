class Notification < ApplicationRecord
  scope :pending, -> { where(seen: false) }

  belongs_to :user
  belongs_to :resource, polymorphic: true

  validates :user, presence: true
  validates :resource, presence: true
  validates :action, presence: true
end
