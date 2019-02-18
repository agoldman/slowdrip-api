class Droplet < ApplicationRecord
  belongs_to :user

  validate :one_per_day, :on => :create

  #TODO: refactor these methods. Turn into scopes.

  def self.random(count, user)
    Droplet.where(user: user).limit(count).order("RANDOM()")
  end

  def today
    Droplet.where("user_id = ?
                   AND created_at >= ? AT TIME ZONE ?
                   AND created_at <= ? AT TIME ZONE ?",
                   user.id,
                  Time.zone.now.beginning_of_day,
                  'PST',
                  Time.zone.now.end_of_day,
                  'PST'
                 )
  end

  def self.day_of_the_week(user)
    Droplet.where("extract(isodow from created_at AT TIME ZONE ?) = ?
                   AND user_id = ?",
                   'PST',
                   Time.zone.now.wday,
                   user.id
                  ).order(created_at: :desc)
  end

  def self.day_of_the_month(user)
    Droplet.where('extract(day from created_at AT TIME ZONE ?) = ?
                   and user_id = ? ',
                   'PST',
                   Time.zone.now.day,
                   user.id
                 ).order(created_at: :desc)
  end

  def self.day_of_the_year(user)
    Droplet.where('extract(month from created_at AT TIME ZONE ?) = ?
                   and extract(day from created_at AT TIME ZONE ?) = ?
                   and user_id = ?',
                   'PST',
                   Time.zone.now.month,
                   'PST',
                   Time.zone.now.day,
                   user.id
                 ).order(created_at: :desc)
  end

  private

  #This is weird but allows for historic seed data to be created
  def one_per_day
    if today.count > 0
      errors.add(:created_at, "can't be duplicate. Droplet already exists for today.")
    end
  end

end
