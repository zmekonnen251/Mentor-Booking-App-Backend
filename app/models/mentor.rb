class Mentor < ApplicationRecord
  after_create :send_admin_mail
  ActiveStorage::Current.url_options = -> { { host: 'localhost', port: 3000 } }
  include Rails.application.routes.url_helpers

  include Mentors::AllowlistMentors
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :allowlisted_mentors_jwts, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :mentor_technologies, dependent: :destroy
  has_one_attached :avatar

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    approved? ? super : :not_approved
  end

  def send_admin_mail
    AdminMailer.new_mentor_waiting_for_approval(email).deliver
  end

  def avatar_url
    if avatar.attached?
      "http://localhost:3000#{Rails.application.routes.url_helpers.rails_blob_path(avatar, only_path: true)}".to_s
    else
      'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250'
    end
  end
end
