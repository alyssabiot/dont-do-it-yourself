CATEGORIES = [ "All categories", "Pets", "Kids", "Garden", "Handiwork", "Beauty / Well-being", "Sports", "IT", "Food", "Mechanics", "Photography", "Music", "Interior design", "Housekeeping", "Fashion", "Paper work / Legal", "Coaching", "Other" ]
CATEGORIES_PHOTOS = [
  {category: "Pets" ,
    photo_filepath: "dog.jpg"
},
  {category: "All categories",
    photo_filepath: "other.jpg"
},
  {category: "Kids",
    photo_filepath: "kids.jpg"
},
  {category: "Garden",
    photo_filepath: "Garden.jpg"
},
  {category: "Handiwork" ,
    photo_filepath: "handiwork.jpg"
},
  {category: "Beauty / Well-being",
    photo_filepath: "Beauty.jpg"
},
  {category: "Sports" ,
    photo_filepath: "sport.jpg"
},
  {category: "IT",
    photo_filepath: "IT.jpg"
},
  {category: "Food",
    photo_filepath: "Food.jpg"
},
  {category: "Mechanics" ,
    photo_filepath: "mechanics.jpg"
},
  {category: "Photography",
    photo_filepath: "photography.jpg"
},
  {category: "Music",
    photo_filepath: "Music.jpg"
},
  {category: "Interior design",
    photo_filepath: "interior design.jpg"
},
  {category: "Housekeeping" ,
    photo_filepath: "Housekeeping.jpg"
},
  {category: "Fashion",
    photo_filepath: "Fashion.jpg"
},
  {category: "Paper work / Legal",
    photo_filepath: "paperwork.jpg"
},
  {category: "Coaching",
    photo_filepath: "coaching.jpg"
},
  {category: "Other",
    photo_filepath: "tree.jpg"
}
]

class Skill < ApplicationRecord
  default_scope { where(active: true) }
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :location, presence: true, allow_blank: false
  validates :title, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates :price_per_hour, presence: true, allow_blank: false
  geocoded_by :location
  after_validation :geocode, if: :location_changed?
end
