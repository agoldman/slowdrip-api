class FriendPolicy
  attr_reader :user, :friend

  def initialize(user, friend)
    @user = user
    @friend = friend
  end

  def show?
    @friend.friends.exists?(@user.id)
  end

  def remove?
    @user == @friend
  end
end