class User < ApplicationRecord
  include Users::Allowlist

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :jwt_authenticatable,
         jwt_revocation_strategy: self

  has_many :allowlisted_jwts, dependent: :destroy

  has_many :bookings, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_one_attached :avatar

  def is?(role)
    self.role == role
  end
end
