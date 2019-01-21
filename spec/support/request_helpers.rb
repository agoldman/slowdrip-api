module RequestHelpers
  def set_authentication_headers_for(user)
    user_headers = user.create_new_auth_token
  end
end
