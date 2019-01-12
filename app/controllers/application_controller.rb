class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def pundit_user
    current_api_v1_user
  end

  def record_not_found(e)
    @response = { success: false, errors: [e] }
    render json: @response, status: :not_found
  end

end

