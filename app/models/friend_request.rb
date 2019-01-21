class FriendRequest < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validate :friend_doesnt_exist, :on => :create
  validate :friend_isnt_self, :on => :create
  validates :friend, uniqueness: { scope: :user,
    message: "request already exists for this friend" }

  def friend_doesnt_exist
    if user.friends.exists?(friend.id)
      errors.add(:friend, "already exists")
    end
  end

  def friend_isnt_self
    if user == friend
      errors.add(:friend, "is yourself")
    end
  end
end
