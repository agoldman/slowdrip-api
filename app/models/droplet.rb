class Droplet < ApplicationRecord
  belongs_to :user

  PERMISSIONS = %w(personal friends).freeze

  enum permission: PERMISSIONS.map{ |item| [item, item] }.to_h, _prefix: :permission

  scope :today, -> { where(:created_at => (Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)) }
  validate :one_per_day, :on => :create

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
 		           Time.zone.now.month,
 		           Time.zone.now.day,
 		           user.id,
 		           "friends"
 		         ).order(created_at: :desc)
  end

  def self.todays_total_droplets(user)
    Droplet.where('extract(month from created_at) = ?
                 and extract(day from created_at) = ?
                 and user_id = ?',
               Time.zone.now.month,
               Time.zone.now.day,
               user.id
             ).order(created_at: :desc)
  end

  private

  #This is weird but allows for historic seed data to be created
  def one_per_day
    if user.droplets.today.count > 0
      errors.add(:created_at, "can't be duplicate. Droplet already exists for today.")
    end
  end

end
