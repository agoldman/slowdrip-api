class Droplet < ApplicationRecord
  belongs_to :user

  def same_day_droplets
  	Droplet.where('extract(month from created_at) = ? and extract(day from created_at) = ?', 
  		           created_at.month, created_at.day
  		         ).order(created_at: :desc)
  end

end
