class AddTaskPropertiesToRecommendationValidations < ActiveRecord::Migration
  def change
    add_column :recommendation_validations, :hit_id, :string
    add_column :recommendation_validations, :assignment_id, :string
    add_column :recommendation_validations, :worked_id, :string
  end
end
