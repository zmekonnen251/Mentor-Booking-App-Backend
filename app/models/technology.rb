class Technology < ApplicationRecord
  validates :name, presence: true
  has_many :mentor_technologies
end
