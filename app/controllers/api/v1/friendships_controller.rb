class Api::V1::FriendshipsController < ApplicationController
  before_action :authenticate_api_v1_user!

  def create
  	@friend = User.find(params.dig(:friend, :id))
  	current_api_v1_user.friends << @friend
  	FriendRequest.where(user: current_api_v1_user, friend: @friend)
  	             .or(FriendRequest.where(user: @friend, friend: current_api_v1_user))
  	             .destroy_all
  	render :show, status: 202
  end

  private

end