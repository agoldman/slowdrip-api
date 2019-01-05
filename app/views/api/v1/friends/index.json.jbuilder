if @user == current_api_v1_user
  json.friends @friends, :id, :name, :image, :uid, :droplets
else
  json.friends @friends, :id, :name, :image, :uid
end