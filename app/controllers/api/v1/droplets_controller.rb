class Api::V1::DropletsController < ApplicationController
  before_action :authenticate_api_v1_user!

  def create
    @droplet = Droplet.new(droplet_params)
    @droplet.user = current_api_v1_user

    if @droplet.save
      #TODO: redirect instead
      @droplets = current_api_v1_user.todays_total_droplets
      render :show, status: 202
    else
      render :json => { :errors => @droplet.errors.full_messages }, status: 422
    end
  end

  def index
    @droplets = current_api_v1_user.droplets.order(created_at: :desc)
  end

  private

  def droplet_params
    params.require(:droplet).permit(:content, :permission)
  end

end
