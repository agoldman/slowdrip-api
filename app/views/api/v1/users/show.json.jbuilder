json.user do
  json.id @user.id
  json.name @user.name
  json.image @user.image
  json.email @user.email
  json.droplets @todays_droplets.droplets
  json.algo @todays_droplets.algo
  json.base_iterator @todays_droplets.base_iterator
end