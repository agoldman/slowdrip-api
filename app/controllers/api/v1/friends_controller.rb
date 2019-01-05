class Api::V1::FriendsController < ApplicationController
  before_action :authenticate_api_v1_user!

  #TODO make this not an n+1 query.
  def index
  	@user = User.find(params[:user_id])
 	@friends = @user.friends.includes(:droplets)
 	@friends.each do |friend|
      nd = friend.droplets.select do |droplet|
            (droplet.permission == "friends") &&
            (droplet.created_at.month == Time.zone.now.month) &&
            (droplet.created_at.day == Time.zone.now.day)
      end
      friend.droplets = nd
 	end
  end

end
