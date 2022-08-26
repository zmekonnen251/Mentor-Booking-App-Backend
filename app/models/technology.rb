class Technology < ApplicationRecord
  validates :name, presence: true
  belongs_to :mentor
end
