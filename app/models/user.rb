class User < ApplicationRecord
  include Users::Allowlist

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :jwt_authenticatable,
         jwt_revocation_strategy: self

  has_many :allowlisted_jwts, dependent: :destroy

  # def for_display
  #   {
  #     id:,
  #     email:
  #   }
  # end
end
