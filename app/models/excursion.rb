class Excursion < ApplicationRecord
  belongs_to :destination
  belongs_to :activity
  validates :destination_id, :activity_id, :season, :description, :price, presence: true
  validates :destination_id, :activity_id, numericality: { only_integer: true }
  validates :price, numericality: true
end
