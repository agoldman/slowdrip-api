class Api::V1::UsersController < ApplicationController
  before_action :authenticate_api_v1_user!

  #Profile page is today's droplets through time
  def show
    @user = User.find(params[:id])
    if @user.id == current_api_v1_user.id
      @droplets = @user.todays_total_droplets
    else
      authorize @user, policy_class: FriendPolicy
      @droplets = @user.todays_friendly_droplets
    end
    render :show, status: 202
  end

end
