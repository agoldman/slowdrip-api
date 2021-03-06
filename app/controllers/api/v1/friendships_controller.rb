class Api::V1::FriendshipsController < ApplicationController
  before_action :authenticate_api_v1_user!

  # TODO build error handling
  def create
  	@friend = User.find(params.dig(:friend, :id))
  	Friendship.create(user: current_api_v1_user, friend: @friend)
  	render :show, status: 202
  end

  def index
    @user = User.find(params[:user_id])
    @friendships = @user.friendships.includes(:friend)
    authorize @friendships.first
  end

  # TODO build error handling
  def destroy
  	@friendship = Friendship.find(params[:id])
  	authorize @friendship
  	@friendship.destroy
  	render json: {}, status: 200
  end

end