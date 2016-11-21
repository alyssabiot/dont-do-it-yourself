class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :skills
  has_many :bookings
  has_many :bookings, through: :skills
  validates :email, uniqueness: true, format: { with: /\A.+@.+\..{2,3}\z/,
    message: "not an email" }
  validates :password, length: { in: 6..20 }
end
