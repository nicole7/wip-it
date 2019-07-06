class Friendship < ApplicationRecord

  # belongs_to :person, :foreign_key => :friend_id
  belongs_to :user
  belongs_to :friend, :class_name => 'User'

  after_create do |p|
    if !Friendship.find(:first, :conditions => {:friend_id => p.person_id})
      Friendship.create!(:person_id => p.friend_id, :friend_id =>p.person_id)
    end
  end

  after_update do |p|
    reciprocal = Friendship.find(:first, :conditions =>{:friend_id => p.person_id})
    reciprocal.is_pending = self.is_pending unless reciprocal.nil?
  end

  after_destroy do |p|
    reciprocal = Friendship.find(:first, :conditions => {:friend_id => p.person_id})
      reciprocal.destroy unless reciprocal.nil?
  end

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
