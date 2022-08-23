class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :mentor

  validates :date, presence: true
end
