class Booking < ApplicationRecord
  belongs_to :skill
  belongs_to :user
  has_many :reviews, dependent: :nullify
  validates :starts_at, presence: true
  validates :duration, presence: true
end
