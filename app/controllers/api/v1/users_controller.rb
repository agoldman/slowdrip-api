class Api::V1::UsersController < ApplicationController
  before_action :authenticate_api_v1_user!

  def show
  	render :show, status: 202
  end
end
