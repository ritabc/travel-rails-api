class Activity < ApplicationRecord
  has_many :excursions
  has_many :destinations, through: :excursions
  validates :name, presence: true

  scope(:search_by_name, -> (name) { Activity.where("name like ?", "%#{name}%") })
  scope(:search_by_id, -> (id) { Activity.where("id = ?", id) if id != nil})
end
