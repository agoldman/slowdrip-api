class Api::V1::FriendsController < ApplicationController
  before_action :authenticate_api_v1_user!

  def index
  	user = User.find(params[:user_id])
    @friends = user.friends
  end

  def remove
  	User.find(params[:user_id]).friendships.find_by(friend: params[:id]).destroy
  	render json: {}, status: :no_content
  end


end