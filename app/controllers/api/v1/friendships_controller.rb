class Api::V1::FriendshipsController < ApplicationController
  before_action :authenticate_api_v1_user!

  #TODO replace with a friend request model
  def create
  	@user = User.find(params[:user_id])
  	@friend = User.find(params.dig(:friend, :id))
  	@user.friends << @friend
  	render :show, status: 202
  end

  private

end