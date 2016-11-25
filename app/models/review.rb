class Review < ApplicationRecord
  belongs_to :skill
  belongs_to :user
  validates :content, length: { minimum: 10 }
  validates :rating, inclusion: { in: [0,1,2,3,4,5], allow_nil: false }
end
