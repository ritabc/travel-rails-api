class Destination < ApplicationRecord
  has_many :reviews
  has_many :excursions
  has_many :activities, through: :excursions
  validates :country, :city, :description, presence: true

  scope(:search_by_place, -> (city, country) do
    if city == nil
      Destination.where("country like ?", "%#{country}%")
    elsif country == nil
      Destination.where("city like ?", "%#{city}%")
    else
      Destination.where("city like ? or country like ?", "%#{city}%", "%#{country}%")
    end
  end)
end
