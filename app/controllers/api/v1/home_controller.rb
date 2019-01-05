class Api::V1::HomeController < ApplicationController
  def index
  	if current_api_v1_user
  	  redirect_to api_v1_user_url(current_api_v1_user)
  	else
	  render :index, status: 202
    end
  end
end