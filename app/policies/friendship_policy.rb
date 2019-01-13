class FriendshipPolicy
  attr_reader :user, :friendship

  def initialize(user, friendship)
    @user = user
    @friendship = friendship
  end

  def destroy?
    @friendship.friend == @user or @friendship.user == @user
  end

  #You can only see your friends or your friends of friends.
  def index?
  	@primary_friend = @friendship.user
  	(@primary_friend == @user) || (user.friends.exists?(@primary_friend.id))
  end

end