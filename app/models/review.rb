class Review < ApplicationRecord
  belongs_to :destination
  belongs_to :user, optional: true
  validates :rating, :content, :destination_id, presence: true
  validates :rating, :destination_id, numericality: { only_integer: true }
  validates :user_id, numericality: { allow_nil: true, only_integer: true}
end
