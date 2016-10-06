class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :leases
  has_many :owned_spaces, class_name: "Space"
  has_many :spaces, through: :leases
  after_update_commit {AppearanceBroadcastJob.perform_later self}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :linkedin]


  def is_online
    self.update_attributes(online:true)
  end

  def is_offline
    self.update_attributes(online:false)
  end

  def self.from_omniauth_facebook(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.first_name = auth.extra.raw_info.first_name
      user.last_name = auth.extra.raw_info.last_name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.online = true
    end
  end

  def self.from_omniauth_linkedin(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.online = true
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
              user.email = data["email"] if user.email.blank?
      elsif data = session["devise.linkedin_data"] && session["devise.linkedin_data"]["info"]
              user.email = data["email"] if user.email.blank?
      end
    end
  end
end
