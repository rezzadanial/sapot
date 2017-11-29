class User < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :gigs
  has_many :proposals
  has_many :educations
  has_many :user_skills
  mount_uploader :avatar, AvatarUploader
end
