CATEGORIES = [ "Pets", "Kids", "Garden", "Handiwork", "Beauty / Well-being", "Sports", "IT", "Food", "Mechanics", "Photography", "Music", "Interior design", "Housekeeping", "Fashion", "Paper work / Legal", "Coaching", "Other" ]

class Skill < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :location, presence: true, allow_blank: false
  validates :title, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates :price_per_hour, presence: true, allow_blank: false
end
