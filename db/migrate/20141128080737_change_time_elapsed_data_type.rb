class ChangeTimeElapsedDataType < ActiveRecord::Migration
  def change
    change_column :restaurant_recommendations, :time_to_complete, :integer
    change_column :recommendation_validations, :time_to_complete, :integer
  end
end
