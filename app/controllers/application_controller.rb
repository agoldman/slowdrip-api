class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit

  private

  def pundit_user
    current_api_v1_user
  end
end

