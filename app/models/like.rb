class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likable, polymorphic: true, counter_cache: true, touch: true
  # belongs_to :recipe
  validates :user, presence: true, uniquness: { scope: [:likable_id, :likable_type] }
  validates :likable, presence: true
end
