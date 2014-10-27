class CreateRestaurantRecommendations < ActiveRecord::Migration
  def change
    create_table :restaurant_recommendations do |t|
      t.text :name
      t.integer :time_to_complete
      t.timestamp :time_of_entry
      t.text :serialized_terms
      t.string :city
      t.string :state
      t.string :country
      t.string :hit_id
      t.string :worker_id
      t.string :assignment_id

      t.timestamps
    end
  end
end
