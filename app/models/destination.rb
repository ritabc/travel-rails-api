class Destination < ApplicationRecord
  has_many :reviews
  has_many :excursions
  has_many :activities, through: :excursions
  validates :country, :city, :description, presence: true
end
