class Mentor < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :mentor_technologies, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :bio, presence: true

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    approved? ? super : :not_approved
  end

  def send_admin_mail
    AdminMailer.new_mentor_waiting_for_approval(email).deliver
  end
end
