# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :droplets
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :friend_requests, dependent: :destroy
  has_many :pending_friends, through: :friend_requests, source: :friend

  #TODO: Make this not insane
  def todays_droplets(minimum_to_show=1)
    droplets = Droplet.day_of_the_year(self)
    algo = "day_of_the_year"
    base_iterator = "#{Time.zone.now.month}/#{Time.zone.now.day}"
    if droplets.count < minimum_to_show
      droplets = Droplet.day_of_the_month(self)
      algo = "day_of_the_month"
      base_iterator = Time.zone.now.day
    end
    if droplets.count < minimum_to_show
      droplets = Droplet.day_of_the_week(self)
      algo = "day_of_the_week"
      base_iterator = Time.zone.now.strftime("%A")
    end
    if droplets.count < minimum_to_show
      droplets = self.droplets
      algo = "all_time"
      base_iterator = nil
    end
    if droplets.count > 20
      droplets = Droplet.random(4, self)
      algo = "random"
      base_iterator = nil
    end
    response = OpenStruct.new
    response.droplets = droplets
    response.algo = algo
    response.base_iterator = base_iterator
    response
  end
end


