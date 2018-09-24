class Review < ApplicationRecord
  belongs_to :destination
  belongs_to :user, optional: true
  validates :rating, :content, :destination_id, presence: true
  validates :rating, :destination_id, numericality: { only_integer: true }
  validates :user_id, numericality: { allow_nil: true, only_integer: true}

  scope(:search_by_destination, -> (destination_id) { Review.where("destination_id = ?", destination_id) if destination_id != nil })
  scope(:search_by_user, -> (user_id) { Review.where("user_id = ?", user_id) if user_id != nil})
end
