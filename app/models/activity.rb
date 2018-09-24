class Activity < ApplicationRecord
  has_many :excursions
  has_many :destinations, through: :excursions
  validates :name, presence: true
end
