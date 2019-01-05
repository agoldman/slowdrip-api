class FriendshipPolicy
  attr_reader :user, :friendship

  def initialize(user, friendship)
    @user = user
    @friendship = friendship
  end

  def destroy?
    @friendship.friend == @user or @friendship.user == @user
  end

end