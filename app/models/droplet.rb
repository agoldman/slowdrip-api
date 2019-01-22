class Droplet < ApplicationRecord
  belongs_to :user

  scope :today, -> { where(:created_at => (Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)) }
  validate :one_per_day, :on => :create

  #TODO: refactor these methods. Turn into scopes.

  def self.random(count, user)
    Droplet.where(user: user).limit(count).order("RANDOM()")
  end

  def self.this_day_through_the_weeks(user)
    Droplet.where('extract(isodow from created_at) = ?
                   and user_id = ? ',
                   Time.zone.now.wday,
                   user.id
                  ).order(created_at: :desc)
  end

  def self.this_day_through_the_months(user)
    Droplet.where('extract(day from created_at) = ?
                   and user_id = ? ',
                   Time.zone.now.day,
                   user.id
                 ).order(created_at: :desc)
  end

  def self.this_day_through_the_years(user)
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
