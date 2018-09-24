class AddDestinationIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :destination_id, :integer
  end
end
