json.friendships @friendships do |friendship|
	json.friend friendship.friend, :id, :name, :image, :uid, :email
end