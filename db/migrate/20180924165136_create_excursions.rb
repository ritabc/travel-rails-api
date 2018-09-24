class CreateExcursions < ActiveRecord::Migration[5.2]
  def change
    create_table :excursions do |t|
      t.integer :destination_id
      t.integer :activity_id
      t.string :season
      t.text :description
      t.integer :price
    end
  end
end
