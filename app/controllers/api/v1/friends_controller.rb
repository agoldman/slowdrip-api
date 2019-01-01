class Api::V1::FriendsController < ApplicationController
  before_action :authenticate_api_v1_user!

  def index
  	user = User.find(params[:user_id])
    @friends = user.friends
  end

  #TODO add authorization so user can only add a friend themselves
  def remove
  	@user = User.find(params[:user_id])
  	authorize @user, policy_class: FriendPolicy
  	@user.friendships.find_by(friend: params[:id]).destroy
  	render json: {}, status: :no_content
  end


end