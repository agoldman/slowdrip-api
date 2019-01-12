class Api::V1::ErrorsController < ApplicationController
  def error_404
  	@response = { success: false, errors: ["Route not found."] }
    render json: @response, status: 404
  end
end