class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from Pundit::NotDefinedError, with: :access_level_not_found
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  private

  def pundit_user
    current_api_v1_user
  end

  def record_not_found(e)
    @response = { success: false, errors: [e] }
    render json: @response, status: :not_found
  end

  def access_level_not_found(e)
    @response = { success: false, errors: ["Unable to find access policy."] }
    render json: @response, status: 500
  end

  def not_authorized(e)
    @response = { success: false, errors: ["Access Denied."] }
    render json: @response, status: 403
  end

end

