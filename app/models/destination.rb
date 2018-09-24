class Destination < ApplicationRecord
  has_many :reviews
  has_many :excursions
  has_many :activities, through: :excursions
  validates :country, :city, :description, presence: true

  scope(:search_by_country, -> (country) { Destination.where("country like ?", "%#{country}%") })
  scope(:search_by_city, -> (city) { Destination.where("city like ?", "%#{city}%") })
end
