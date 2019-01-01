class Friendship < ActiveRecord::Base

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  after_create :create_inverse, unless: :has_inverse?
  after_destroy :destroy_inverses, if: :has_inverse?

  validates :user, presence: true
  validates :friend, presence: true, uniqueness: { scope: :user }

  validate :friend_request_exists, :on => :create
  validate :not_self

  def create_inverse
    self.class.create(inverse_friendship_options)
  end

  def destroy_inverses
    inverses.destroy_all
  end

  def has_inverse?
    self.class.exists?(inverse_friendship_options)
  end

  def inverses
    self.class.where(inverse_friendship_options)
  end

  def inverse_friendship_options
    { user_id: friend_id, friend_id: user_id }
  end

  private

  def not_self
    errors.add(:friend, "can't be equal to user") if user == friend
  end

  #Only allow friendships to be formed when they were initiated by a request.
  #The request must have come from the "other" friend. You cannot accept
  #your own friend request.
  def friend_request_exists
    if FriendRequest.where(user: friend, friend: user).count < 1
      errors.add(:friend, "friendship requires friend request initiated by friend")
    end
  end

end