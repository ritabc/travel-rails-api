class Excursion < ApplicationRecord
  belongs_to :destination
  belongs_to :activity
  validates :destination_id, :activity_id, :season, :description, :price, presence: true
  validates :destination_id, :activity_id, numericality: { only_integer: true }
  validates :price, numericality: true

  scope(:search_by_destination_id, -> (destination_id) { Excursion.where("destination_id = ?", destination_id) if destination_id != nil })
  scope(:search_by_activity_id, -> (activity_id) { Excursion.where("activity_id = ?", activity_id) if activity_id != nil})
  scope(:search_by_season, -> (season) { Excursion.where("season like ?", "%#{season}%") })
  scope(:search_by_price, -> (price) { Excursion.where("price = ?", price)  if price != nil })

end
