class Api::V1::FriendRequestsController < ApplicationController
  before_action :authenticate_api_v1_user!
  before_action :set_friend_request, except: [:index, :create]

  def create
    friend = User.find(params.dig(:friend, :id))
    @friend_request = current_api_v1_user.friend_requests.new(friend: friend)

    if @friend_request.save
      render :show, status: :created
    else
      @response = { success: false, errors: @friend_request.errors }
      render json: @response, status: :unprocessable_entity
    end
  end

  def index
    @incoming = FriendRequest.where(friend: current_api_v1_user)
                             .includes(:user, :friend)
    @outgoing = current_api_v1_user.friend_requests.includes(:friend)
  end

  #TODO: add auth: can only destroy a request if you are the user or friend in the request.
  def destroy
    @friend_request.destroy
    head :no_content
  end

  private

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end
end
