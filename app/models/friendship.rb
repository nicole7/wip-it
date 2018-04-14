class Friendship < ApplicationRecord

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  after_create :make_two_sided_friendship
  after_destroy :destroy_two_sided_friendship

  validate :not_self

  private

  def make_two_sided_friendship
    unless Friendship.exists?(user: self.friend, friend: self.user)
      Friendship.create(user: self.friend, friend: self.user)
    end
  end

  def destroy_two_sided_friendship
    if Friendship.exits?(user: self.friend, friend: self.user).destroy
    end
  end

  def not_self
    error.add(:friend, "can't be equal to user") if user == friend
  end
end
