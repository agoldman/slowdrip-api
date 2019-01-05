class Api::V1::FriendsController < ApplicationController
  before_action :authenticate_api_v1_user!

  def index
  	@user = User.find(params[:user_id])
 	@friends = @user.friends.includes(:droplets)
  end

end