class Api::V1::FriendshipsController < ApplicationController
  before_action :authenticate_api_v1_user!

  # TODO build error handling
  def create
  	@friend = User.find(params.dig(:friend, :id))
  	Friendship.create(user: current_api_v1_user, friend: @friend)
  	render :show, status: 202
  end

end