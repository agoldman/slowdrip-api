class Api::V1::DropletsController < ApplicationController
  before_action :authenticate_api_v1_user!

  def create
  	@user = User.find(params[:user_id])
  	@droplet = @user.droplets.create(droplet_params)
  	#TODO handle errors (no user, max size limit)
  	render :show, status: 202
  end

  def show
  	@droplet = Droplet.find(params[:id])
    @droplets = @droplet.same_day_droplets
  	render :show, status: 202
  end

  def index
    @droplets = User.find(params[:user_id]).droplets.order(created_at: :desc)
  end

  private

  def droplet_params
  	params.require(:droplet).permit(:content)
  end

end
