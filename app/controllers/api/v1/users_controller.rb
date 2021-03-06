class Api::V1::UsersController < ApplicationController
  before_action :authenticate_api_v1_user!

  #Profile page is today's droplets through time
  def show
    @user = User.find(params[:id])
    if @user.id == current_api_v1_user.id
      @todays_droplets = @user.todays_droplets
    else
      authorize @user, policy_class: FriendPolicy
      @todays_droplets = @user.todays_droplets
    end
    render :show, status: 200
  end

  def search
    @users = User.where(email: params[:email])
  end

end
