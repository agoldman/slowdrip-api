class Droplet < ApplicationRecord
  belongs_to :user

  PERMISSIONS = %w(personal friends).freeze

  enum permission: PERMISSIONS.map{ |item| [item, item] }.to_h, _prefix: :permission

  #TODO: refactor these methods. Turn into scope.
  def friendly_same_day_droplets(user)
   	Droplet.where('extract(month from created_at) = ?
  		           and extract(day from created_at) = ?
  		           and user_id = ?
  		           and permission = ?',
 		           created_at.month,
 		           created_at.day,
 		           user.id,
 		           "friends"
 		         ).order(created_at: :desc)
  end

  def self.todays_friendly_droplets(user)
  	Droplet.where('extract(month from created_at) = ?
  		           and extract(day from created_at) = ?
  		           and user_id = ?
  		           and permission = ?',
 		           Time.now.month,
 		           Time.now.day,
 		           user.id,
 		           "friends"
 		         ).order(created_at: :desc)
  end

  def self.todays_total_droplets(user)
    Droplet.where('extract(month from created_at) = ?
                 and extract(day from created_at) = ?
                 and user_id = ?',
               Time.now.month,
               Time.now.day,
               user.id
             ).order(created_at: :desc)
  end

end
