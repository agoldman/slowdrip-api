json.user do
  json.id @user.id
  json.name @user.name
  json.image @user.image
  json.email @user.email
  json.droplets @droplets
end