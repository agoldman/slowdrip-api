class Friendship < ActiveRecord::Base

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def self.two_way_create(user, friend)
  	user.friends << friend
  	friend.friends << user
  end

  def self.two_way_destroy(user, friend)
  	friendship = user.friendships.find_by(friend: friend)
  	friendship_inverse = friend.friendships.find_by(friend: user)
  	Friendship.where(:id => [friendship.id, friendship_inverse.id]).destroy_all
  end

end