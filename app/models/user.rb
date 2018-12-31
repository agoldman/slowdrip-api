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

  def todays_friendly_droplets
  	Droplet.todays_friendly_droplets(self)
  end

  def todays_total_droplets
  	Droplet.todays_total_droplets(self)
  end

end
