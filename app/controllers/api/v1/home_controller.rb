class Api::V1::HomeController < ApplicationController
  def index
	render :index, status: 202
  end
end