class Droplet < ApplicationRecord
  belongs_to :user

  def same_day_droplets(user)
  	Droplet.where('extract(month from created_at) = ?
  		           and extract(day from created_at) = ?
  		           and user_id = ?',
 		           created_at.month,
 		           created_at.day,
 		           user.id
 		         ).order(created_at: :desc)
  end
end
