class Activity < ApplicationRecord
  has_many :excursions
  has_many :destinations, through: :excursions
end
