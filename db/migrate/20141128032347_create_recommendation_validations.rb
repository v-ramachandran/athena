class CreateRecommendationValidations < ActiveRecord::Migration
  def change
    create_table :recommendation_validations do |t|
      t.references :restaurant_recommendation
      t.integer :time_to_complete
      t.timestamp :time_of_entry
      t.boolean :valid

      t.timestamps
    end
    add_index :recommendation_validations, :restaurant_recommendation_id, name: "validating_recommendation_id"
  end
end
